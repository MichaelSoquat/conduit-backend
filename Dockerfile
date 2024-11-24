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

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM base as build

WORKDIR /usr/src/app

COPY . .

RUN chmod +x /usr/src/app/entrypoint.sh

FROM python:3.6-slim

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /usr/src/app

COPY --from=build /usr/src/app /usr/src/app

EXPOSE 8000

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
