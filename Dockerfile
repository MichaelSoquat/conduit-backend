FROM python:3.6-slim as base

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    musl-dev \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x /usr/src/app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
