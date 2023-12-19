import 'package:flutter_app/apis/repository.dart';
import 'package:flutter_app/entities/auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref);
}

class AuthRepository extends Repository {
  AuthRepository(super.ref);

  Future<Auth> create({
    required String email,
    required String password,
  }) async {
    final json = await client.post('/auth', {
      'email': email,
      'password': password,
    });

    return Auth.fromJson(json);
  }

  Future<Auth> signInWithApple(AuthorizationCredentialAppleID credentials) async {
    if (credentials.identityToken == null) {
      throw '계정을 불러올 수 없습니다.';
    }

    final json = await client.get('/oauth/apple/callback', {
      'access_token': credentials.identityToken,
    });

    return Auth.fromJson(json);
  }

  Future<Auth> signInWithGoogle(GoogleSignInAuthentication credentials) async {
    if (credentials.accessToken == null) {
      throw '계정을 불러올 수 없습니다.';
    }

    final json = await client.get('/oauth/google/callback', {
      'access_token': credentials.accessToken,
    });

    return Auth.fromJson(json);
  }
}
