import 'package:get_it/get_it.dart';
import 'package:pasindu_sample_app/core/data/datasources/socket/impl/ticks_socket_datasource_impl.dart';

import 'package:pasindu_sample_app/core/data/datasources/socket/ticks_socket_datasource.dart';

Future<void>? setup(GetIt di) async {
  di.registerLazySingleton<TicksSocketDataSource>(
      () => TicksSocketDataSourceImpl(socketManager: di()));
}
