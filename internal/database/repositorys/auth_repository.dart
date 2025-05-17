import '../../application/DTOs/auth_dto.dart';
import '../models/auth.dart';

abstract class AuthRepository {
  Future<Auth?> getUserByUsername(String username);

  Future<void> createUser(AuthDTO auth);
}
