FROM python:3.10-slim

# Copy only requirements to cache them in docker layer
WORKDIR /code
COPY ./python/mercury /code

# Project initialization:
RUN apt-get update -y && apt-get install -y gcc
RUN pip install --upgrade pip && pip install -r requirements.txt
EXPOSE 8000

CMD ["mercury", "run"]