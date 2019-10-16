FROM node:12.6.0
LABEL name="nodejs-chrome"

# Install and configure packages
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list \
 && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
 && set -x \
 && apt-get update -y \
 && apt-get install -y google-chrome-stable \
 && node -v \
 && npm -v \
 && google-chrome --version
 
ENV CHROME_BIN /usr/bin/google-chrome

# create user
RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser

user appuser
