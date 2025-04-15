# ==============================================================================
# Use the official Ruby image from Docker Hub
# ------------------------------------------------------------------------------
FROM ruby:3.2.2

# ==============================================================================
# Set environment variables
# ------------------------------------------------------------------------------
ENV RAILS_ROOT /wildflower_designs

# ==============================================================================
# Create and set the working directory
# ------------------------------------------------------------------------------
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# ==============================================================================
# Install system dependencies
# ------------------------------------------------------------------------------
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client imagemagick

# ==============================================================================
# Copy Gemfile and install gems
# ------------------------------------------------------------------------------
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --without development test

# ==============================================================================
# Copy the main application
# ------------------------------------------------------------------------------
COPY . .


ARG DB_NAME
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_HOST

ENV DB_NAME=$DB_NAME
ENV DB_USERNAME=$DB_USERNAME
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_HOST=$DB_HOST

# ==============================================================================
# Precompile assets
# ------------------------------------------------------------------------------
RUN bundle exec rails assets:precompile

# ==============================================================================
# Expose port 8538 to the Docker host
# ------------------------------------------------------------------------------
EXPOSE 3000

# ==============================================================================
# The default command that gets run will start the Puma server
# ------------------------------------------------------------------------------
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]