FROM python:3.9-slim

WORKDIR /app

COPY . $WORKDIR

RUN apt-get update && \
    apt-get install -y build-essential gcc 

RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    python manage.py makemigrations && \
    python manage.py migrate && \
    python manage.py createsuperuser --noinput

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]