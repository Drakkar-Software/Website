######################
# Stage: Builder
FROM ruby:2.6.5-alpine as Builder

ARG FOLDERS_TO_REMOVE
ARG BUNDLE_WITHOUT
ARG RAILS_ENV

ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}
ENV RAILS_ENV ${RAILS_ENV}
ENV SECRET_KEY_BASE null
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_ROOT /usr/src/app

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    git \
    imagemagick \
    nodejs \
    tzdata

WORKDIR $RAILS_ROOT

# Install gems
ADD Gemfile* /$RAILS_ROOT/
RUN bundle config --global frozen 1 \
 && bundle install -j4 --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

# Add the Rails app
ADD . /$RAILS_ROOT

# Precompile assets
RUN bundle exec rake assets:precompile

# Remove folders not needed in resulting image
RUN rm -rf $FOLDERS_TO_REMOVE

###############################
# Stage Final
FROM ruby:2.6.5-alpine

ARG ADDITIONAL_PACKAGES

# Set Rails env
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_ROOT /usr/src/app

# Add Alpine packages
RUN apk add --update --no-cache \
    postgresql-client \
    imagemagick \
    $ADDITIONAL_PACKAGES \
    tzdata \
    file \
    nodejs

# Add user
RUN addgroup -g 1000 -S app \
 && adduser -u 1000 -S app -G app
USER app

# Copy app with gems from former build stage
COPY --from=Builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /$RAILS_ROOT /$RAILS_ROOT

WORKDIR /$RAILS_ROOT

# Expose Puma port
EXPOSE 3000

# Start up
CMD ["docker/startup.sh"]