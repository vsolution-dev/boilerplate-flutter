import 'package:flutter_app/apis/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

class UserRepository extends Repository {
  UserRepository(super.ref);

  Future<void> create({
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    await client.post('/users', {
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
  }
}
