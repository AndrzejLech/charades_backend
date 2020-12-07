FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:1.17.2
RUN bundle install
RUN bundle update
COPY . /myapp
CMD rails s -b "0.0.0.0" --port 3000
CMD cd ./myapp
CMD sh deploy.sh