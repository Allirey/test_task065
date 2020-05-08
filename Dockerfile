FROM python:3.7-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /code/

RUN bash -c "python3 manage.py migrate && python3 manage.py collectstatic --noinput"

EXPOSE 8000