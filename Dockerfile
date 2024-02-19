FROM node:14.18.2-buster
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        build-essential \
        curl \
        nmap \
        git \
        nano \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @vue/cli
RUN npm run build