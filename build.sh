#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Applying migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Creating superuser..."
DJANGO_SUPERUSER_EMAIL="admin@example.com"
DJANGO_SUPERUSER_USERNAME="admin"
DJANGO_SUPERUSER_PASSWORD="admin123"

python manage.py createsuperuser --noinput --email $DJANGO_SUPERUSER_EMAIL --username $DJANGO_SUPERUSER_USERNAME || echo "Superuser already exists"

echo "Build process completed successfully!"
