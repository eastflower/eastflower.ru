# docker build -t iamteacher/eastflower.ru:webapp.amd64 -f Eastflower.Amd64.Dockerfile ../

FROM iamteacher/opencook.ru:webapp.amd64

# sqlite3 libsqlite3-0 libsqlite3-dev
RUN apt-get install libsqlite3-dev

SHELL ["/bin/bash", "--login", "-c"]

COPY Gemfile /home/Gemfile
COPY Gemfile.lock /home/Gemfile.lock
COPY X_GEMS /home/X_GEMS

WORKDIR /home
RUN /root/.rbenv/shims/bundle
