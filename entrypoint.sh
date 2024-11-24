#!/bin/bash

set -e
python manage.py migrate
python manage.py createsuperuser --noinput --email "$DJANGO_SUPERUSER_EMAIL" --username "$DJANGO_SUPERUSER_USERNAME"
        
exec python manage.py runserver 0.0.0.0:8000