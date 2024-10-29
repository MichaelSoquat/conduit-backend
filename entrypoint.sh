#!/bin/bash

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --noinput --username $DJANGO_SUPERUSER_USERNAME --email $DJANGO_SUPERUSER_EMAIL

gunicorn conduit-backend.wsgi:application --bind 0.0.0.0:8000