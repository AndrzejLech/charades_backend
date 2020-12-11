FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:1.17.2
RUN bundle install
RUN bundle update
RUN rm -f /myapp/tmp/pids/server.pid
COPY . /myapp
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
