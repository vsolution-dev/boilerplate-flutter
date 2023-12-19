import 'package:flutter_app/providers/api_client_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class Repository {
  final Ref ref;

  Repository(this.ref);

  ApiClient get client => ref.read(apiClientProvider);
}
