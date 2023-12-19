import 'package:flutter_app/apis/repository.dart';
import 'package:flutter_app/entities/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_me_repository.g.dart';

@riverpod
UserMeRepository userMeRepository(UserMeRepositoryRef ref) {
  return UserMeRepository(ref);
}

class UserMeRepository extends Repository {
  UserMeRepository(super.ref);

  Future<User> find() async {
    final json = await client.get('/users/me');

    return User.fromJson(json['user']);
  }

  Future<User> update() async {
    final json = await client.patch('/users/me', {
      //..
    });

    return User.fromJson(json['user']);
  }

  Future<void> delete() async {
    await client.delete('/users/me');
  }
}
