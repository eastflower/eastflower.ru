# docker build -t iamteacher/eastflower.ru:webapp.arm64 -f Eastflower.Arm64.Dockerfile ../

FROM iamteacher/opencook.ru:webapp.arm64

# sqlite3 libsqlite3-0 libsqlite3-dev
RUN apt-get install libsqlite3-dev

SHELL ["/bin/bash", "--login", "-c"]

RUN /root/.rbenv/shims/gem install sqlite3 -v '1.3.13'

COPY Gemfile /home/Gemfile
COPY Gemfile.lock /home/Gemfile.lock
COPY X_GEMS /home/X_GEMS

RUN cd /home && /root/.rbenv/shims/bundle
