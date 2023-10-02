FROM dart:3.1.1 AS dart

WORKDIR /app
COPY  ./compiler-dart/pubspec.* ./
RUN dart pub get

COPY ./compiler-dart/. .
RUN dart pub get --offline
RUN dart compile exe bin/compiler.dart -o bin/dart-compiler

FROM scratch
COPY ./var/rinha/source.rinha.json /var/rinha/source.rinha.json
COPY --from=dart /runtime/ /
COPY --from=dart /app/bin/dart-compiler /app/bin/

CMD ["/app/bin/dart-compiler"]