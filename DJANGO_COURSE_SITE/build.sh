#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r DJANGO_COURSE_SITE/requirements.txt

python DJANGO_COURSE_SITE/manage.py collectstatic --no-input
python  DJANGO_COURSE_SITE/manage.py migrate
