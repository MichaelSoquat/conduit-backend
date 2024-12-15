#!/bin/bash

set -e
python manage.py migrate
python manage.py makemigrations
python manage.py createsuperuser --noinput --email "$DJANGO_SUPERUSER_EMAIL" --username "$DJANGO_SUPERUSER_USERNAME"
python manage.py collectstatic --noinput
        
gunicorn conduit.wsgi:application --bind 0.0.0.0:8000