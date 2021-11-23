FROM ruby:3.0.2

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app
RUN bundle install

EXPOSE 3000

CMD ["sh", "server.sh"]