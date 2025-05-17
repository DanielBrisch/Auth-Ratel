FROM dart:stable

WORKDIR /ratel

COPY pubspec.* /ratel/
RUN dart pub get

COPY . /ratel/
COPY .env .env

RUN dart pub get 

CMD ["dart", "run", "main.dart"]
