FROM ruby:2.6.3-stretch

# Set Rails environment to production
ENV RAILS_ENV production

# Install requirements
RUN  apt-get update -qq && apt-get install -y nodejs postgresql-client

# Creates app env
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Runs bundle install with cache
RUN bundle install --without development test

# Copy application code
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Start the application server
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
