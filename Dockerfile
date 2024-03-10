FROM python:3.10.0a2-slim-buster as base
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
FROM base AS test
CMD ["pytest"]
FROM base AS build
EXPOSE 5000
CMD ["python", "app.py"]