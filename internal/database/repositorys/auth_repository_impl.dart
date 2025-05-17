import 'package:ratel/database/repository.dart';

import '../../application/DTOs/auth_dto.dart';
import '../models/auth.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends RatelRepository<Auth>
    implements AuthRepository {
  @override
  Future<void> createUser(AuthDTO auth) async {
    final sql =
        'INSERT INTO auth (username, password) VALUES (@username, @password)';

    await execute(
      sql,
      substitutionValues: {
        'username': auth.userName,
        'password': auth.password,
      },
    );
  }

  @override
  Future<Auth?> getUserByUsername(String username) async {
    final sql =
        'SELECT id, username, password FROM auth WHERE username = @username';
    final result = await execute(
      sql,
      substitutionValues: {'username': username},
    );
    // if (result == null) return null;
    return result?.first;
  }
}
