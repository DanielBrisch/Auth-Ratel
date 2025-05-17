import 'package:dotenv/dotenv.dart';
import 'package:ratel/annotations/geral_annotations.dart';
import 'package:ratel/core/server.dart';
import 'package:ratel/database/database.dart';

import 'config/di.dart';
import 'internal/handlers/auth_handler.dart';

void main() async {
  var env = DotEnv()..load();

  Auth.jwtKey = env['JWT_KEY'];

  final server = RatelServer(
    port: 8081,
    handlers: [AuthHandler],
    database: RatelDatabase(
      host: env['DB_HOST']!,
      databaseName: env['DB_NAME']!,
      username: env['DB_USER']!,
      password: env['DB_PASSWORD']!,
      port: env['DB_PORT']!,
    ),
    jwtKey: env['JWT_KEY'],
    bindings: GlobalBindings(),
  );

  server.startServer();
}
