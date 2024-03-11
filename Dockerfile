FROM python:3.7 as builder
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt

FROM builder AS test
CMD ["pytest", "test_app.py"]

FROM builder AS build
EXPOSE 5000
CMD ["python", "app.py"]