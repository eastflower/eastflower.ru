#
# ARM: docker build -t iamteacher/eastflower.ru:webapp.arm64 -f Eastflower.Dockerfile --build-arg PLATFORM=arm ../
# AMD: docker build -t iamteacher/eastflower.ru:webapp.amd64 -f Eastflower.Dockerfile --build-arg PLATFORM=amd ../
#
# docker push iamteacher/eastflower.ru:webapp.arm64
# docker push iamteacher/eastflower.ru:webapp.amd64

ARG PLATFORM
FROM iamteacher/opencook.ru:ok.${PLATFORM}64

USER lucky

# NODE. To update local .bash_profile
RUN touch ~/.bash_profile
ENV NVM_DIR="/opt/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

COPY Gemfile /home/lucky/app/Gemfile
COPY Gemfile.lock /home/lucky/app/Gemfile.lock
COPY X_GEMS /home/lucky/app/X_GEMS

WORKDIR /home/lucky/app
RUN bundle
