FROM python:3.8.0-alpine3.10

RUN apk add --no-cache git
RUN git clone https://github.com/theblackturtle/CORSTest
WORKDIR /CORSTest

CMD ["python3","corstest.py"]
