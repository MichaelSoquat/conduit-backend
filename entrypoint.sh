#!/usr/bin/env bash

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --noinput \
  --email "$DJANGO_SUPERUSER_EMAIL" \
  --username "$DJANGO_SUPERUSER_USERNAME"

gunicorn conduit.wsgi:application --bind 0.0.0.0:8000