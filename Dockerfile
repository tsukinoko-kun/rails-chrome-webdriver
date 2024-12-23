FROM ruby:3
ARG CHROMEDRIVER_VERSION=114.0.5735.90
ENV CHROMEDRIVER_VERSION=${CHROMEDRIVER_VERSION}
WORKDIR /rails-chrome-webdriver
COPY ./Gemfile /rails-chrome-webdriver/Gemfile
COPY ./Gemfile.lock /rails-chrome-webdriver/Gemfile.lock
RUN apt-get update -q && apt-get install -y build-essential libsqlite3-dev && \
    bundle install && \
    wget https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip -O chromedriver.zip && \
    unzip chromedriver.zip && \
    chmod +x chromedriver && \
    mv chromedriver /usr/local/bin && \
    wget https://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROMEDRIVER_VERSION}-1_amd64.deb -O chrome.deb && \
    apt-get install -y ./chrome.deb
WORKDIR /
RUN rm -rf /rails-chrome-webdriver
