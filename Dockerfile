# Use the official Ruby image as the base image
FROM ruby:3.2.0-alpine

RUN apk update && apk add --virtual build-dependencies build-base
RUN apk add tzdata

# Set the working directory inside the Docker image
WORKDIR /app

RUN gem install bundler

# Copy the Gemfile and Gemfile.lock files into the working directory
COPY Gemfile Gemfile.lock ./

# Install the required gems
RUN bundle install

# Copy the rest of the application code into the working directory
COPY . ./

# Expose port 3000 to the host machine
EXPOSE 3000


# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]