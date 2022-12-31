#
# ARM: docker build -t iamteacher/eastflower.ru:webapp.arm64 -f Eastflower.Dockerfile --build-arg PLATFORM=arm ../
# AMD: docker build -t iamteacher/eastflower.ru:webapp.amd64 -f Eastflower.Dockerfile --build-arg PLATFORM=amd ../
#
# docker push iamteacher/eastflower.ru:webapp.arm64
# docker push iamteacher/eastflower.ru:webapp.amd64

ARG PLATFORM
FROM iamteacher/rails4:2022.${PLATFORM}64

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Ruby App. Install gems
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

USER lucky

RUN gem install bundler -v 1.17.3 --verbose --no-ri --no-rdoc --no-document

RUN git config --global --add safe.directory /home/lucky/app
RUN mkdir /home/lucky/app
WORKDIR /home/lucky/app

COPY Gemfile /home/lucky/app/Gemfile
COPY Gemfile.lock /home/lucky/app/Gemfile.lock

COPY X_GEMS /home/lucky/app/X_GEMS

RUN bundle
EXPOSE 3000/tcp
