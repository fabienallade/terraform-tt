FROM python:3.13.9-alpine3.22

WORKDIR /app

COPY requirements.txt /app
RUN pip3 install -r requirements.txt

COPY . /app

RUN echo "web-app" > /app/tmp_ai_check.txt

EXPOSE 5000

ENTRYPOINT ["flask", "run" ,"--host=0.0.0.0"]