# docker build -t iamteacher/eastflower.ru:webapp.arm64 -f Eastflower.Arm64.Dockerfile ../
# docker push iamteacher/eastflower.ru:webapp.arm64

FROM iamteacher/opencook.ru:webapp.arm64

# sqlite3 libsqlite3-0 libsqlite3-dev
RUN apt-get install libsqlite3-dev

SHELL ["/bin/bash", "--login", "-c"]

COPY Gemfile /home/Gemfile
COPY Gemfile.lock /home/Gemfile.lock
COPY X_GEMS /home/X_GEMS

WORKDIR /home
RUN /root/.rbenv/shims/bundle
