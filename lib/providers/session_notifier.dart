import 'package:flutter/material.dart';
import 'package:flutter_app/apis/auth_repository.dart';
import 'package:flutter_app/apis/user_me_repository.dart';
import 'package:flutter_app/entities/user.dart';
import 'package:flutter_app/providers/shared_preferences_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionNotifier extends ChangeNotifier {
  static final provider = ChangeNotifierProvider<SessionNotifier>((ref) {
    final session = SessionNotifier(ref);
    session.fetch();
    return session;
  });

  final Ref _ref;
  String _accessToken = '';
  User _user = User();

  User get user => _user;

  bool get isLoggedIn => _accessToken.isNotEmpty;

  SessionNotifier(this._ref);

  SharedPreferences get _sharedPreferences => _ref.read(sharedPreferencesProvider);

  UserMeRepository get _userMeRepository => _ref.read(userMeRepositoryProvider);

  AuthRepository get _authRepository => _ref.read(authRepositoryProvider);

  Future<void> fetch() async {
    try {
      final user = await _userMeRepository.find();

      _user = user;
      notifyListeners();
    } catch (error) {
      signOut();
    }
  }

  Future<void> signIn(
    String email,
    String password,
  ) async {
    final auth = await _authRepository.create(
      email: email,
      password: password,
    );

    _user = auth.user;
    _accessToken = auth.accessToken;
    _sharedPreferences.setString('accessToken', _accessToken);
  }

  signOut() {
    _user = User();
    _accessToken = '';
    _sharedPreferences.remove('accessToken');
    notifyListeners();
  }
}
