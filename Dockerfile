FROM ruby:3
ARG CHROMEDRIVER_VERSION=114.0.5735.90
ENV CHROMEDRIVER_VERSION=${CHROMEDRIVER_VERSION}
RUN apt-get update -q && apt-get install -y build-essential libsqlite3-dev
RUN wget https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip -O chromedriver.zip
RUN unzip chromedriver.zip
RUN chmod +x chromedriver
RUN mv chromedriver /usr/local/bin
RUN wget https://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROMEDRIVER_VERSION}-1_amd64.deb -O chrome.deb
RUN apt-get install -y ./chrome.deb
