FROM ruby:2.5-alpine
ENV BUNDLERVERSION=1.17.3
ENV CASSANDRA_HOST=127.0.0.1
ENV CASSANDRA_PORT=9042
ENV CASSANDRA_USERNAME=""
ENV CASSANDRA_PASSWORD=""

RUN apk update && \
    apk add git make gcc libc-dev g++
RUN git clone https://github.com/avalanche123/cassandra-web.git /cassandra-web
WORKDIR /cassandra-web
RUN gem install bundler -v $BUNDLERVERSION && \
    bundle install

EXPOSE 3000
# CMD cassandra-web --hosts CASSANDRA_HOST --port $CASSANDRA_PORT --username="$CASSANDRA_USERNAME" --password="$CASSANDRA_PASSWORD"
CMD /cassandra-web/bin/cassandra-web --hosts "$CASSANDRA_HOST" --port "$CASSANDRA_PORT"