import 'package:flutter_app/apis/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_repository.g.dart';

@riverpod
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepository(ref);
}

class DeviceRepository extends Repository {
  DeviceRepository(super.ref);

  Future<void> update(String token) async {
    await client.post('/devices', {
      'token': token,
    });
  }
}
