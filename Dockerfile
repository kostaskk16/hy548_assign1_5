FROM python:3.13.2

ENV PYTHONUNBUFFERED=1

WORKDIR /app

VOLUME /app/repo/django/db

RUN apt-get update && apt-get install -y git vim-tiny && \
    git clone --depth=1 https://github.com/chazapis/hy548 /app/repo && \
    mkdir -p /app/repo/django/db && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip && \
    pip install -r /app/repo/django/requirements.txt && \
    python /app/repo/django/manage.py migrate


CMD ["python", "/app/repo/django/manage.py", "runserver", "0.0.0.0:8000"]
