FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /code/

RUN  python manage.py migrate && python manage.py runserver 0.0.0.0:8000

EXPOSE 8000