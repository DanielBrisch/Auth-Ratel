import 'dart:io' as http;

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:ratel/annotations/geral_annotations.dart';
import 'package:ratel/core/response.dart';
import 'package:ratel/dependency_injector/injector.dart';
import 'package:ratel/http/handler.dart';

import '../application/DTOs/auth_dto.dart';
import '../database/repositorys/auth_repository.dart';

class AuthHandler extends RatelHandler {
  final AuthRepository repository;

  AuthHandler() : repository = Injector().get<AuthRepository>();

  @Post('/auth/login')
  Future<Response> login(
    @Param() String? username,
    @Param() String? password,
  ) async {
    if (username == null && password == null) {
      return Response(
        statusCode: http.HttpStatus.badGateway,
        data: 'Parameters not provided',
      );
    }
    final user = await repository.getUserByUsername(username!);
    if (user == null) {
      return Response(
        statusCode: http.HttpStatus.notFound,
        data: 'User not registered',
      );
    }

    if (user.password != password) {
      return Response(
        statusCode: http.HttpStatus.unauthorized,
        data: 'Invalid credentials',
      );
    }

    final payload = {'username': username, 'password': password};
    final jwt = JWT(payload);
    final token = jwt.sign(SecretKey(Auth.jwtKey!));
    return Response(statusCode: http.HttpStatus.ok, data: {'token': token});
  }

  @Post('/auth/register')
  Future<Response> register(@Body() AuthDTO credentials) async {
    if (credentials.checkEmptyFields(checkConfirmPassword: true)) {
      return Response(
        statusCode: http.HttpStatus.badGateway,
        data: 'Parameters not provided',
      );
    }

    final user = await repository.getUserByUsername(credentials.userName!);
    if (user != null) {
      return Response(
        statusCode: http.HttpStatus.conflict,
        data: 'A user with this username already exists',
      );
    }
    if (!credentials.checkIfPasswordEqualsConfirmPassword()) {
      return Response(
        statusCode: http.HttpStatus.badRequest,
        data: 'Passwords do not match',
      );
    }
    await repository.createUser(credentials);

    return Response(
      statusCode: http.HttpStatus.created,
      data: 'User registered successfully',
    );
  }
}
