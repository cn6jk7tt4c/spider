FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    unzip \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

RUN pip install --no-cache-dir flask

COPY . /app
WORKDIR /app

RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
