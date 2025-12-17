FROM python:3-alpine

COPY ./requirements.txt /

RUN pip install --no-cache-dir -r /requirements.txt

WORKDIR /app

EXPOSE 8000

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]