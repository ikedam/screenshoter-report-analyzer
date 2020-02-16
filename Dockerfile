FROM node:6

WORKDIR /app

RUN apt-get update \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt-get install -y --no-install-recommends ./google-chrome*.deb \
  && rm google-chrome*.deb \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g bower

COPY bower.json .
COPY package.json .
COPY package-lock.json .

RUN bower --allow-root install \
  && npm install
