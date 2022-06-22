FROM ruby:2.7.1-alpine

ARG RAILS_ROOT=/app
ARG PACKAGES="vim openssl-dev build-base curl nodejs yarn less tzdata git bash screen sqlite sqlite-dev"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

RUN gem install bundler:2.1.4

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}
ENV APP_VERSION=1.0

EXPOSE 3000
# CMD bundle exec rails s -b '0.0.0.0' -p 3000
CMD ["bash", "-c", "bin/rails db:create && bin/rails db:migrate && bundle exec rails s -b '0.0.0.0' -p 3000"]
