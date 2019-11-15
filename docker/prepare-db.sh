#! /bin/sh

# If database exists, migrate. Otherweise setup (create and seed)
echo "Preparing db..."
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
echo "Done!"
