import 'package:get_it/get_it.dart';
import 'package:pasindu_sample_app/core/plugins/web_socket_manager/socket_manager.dart';

Future<void>? setup(GetIt di) {
  di.registerLazySingleton(
      () => SocketManager(environmentalStore: di(), uuid: di()));
  return null;
}
