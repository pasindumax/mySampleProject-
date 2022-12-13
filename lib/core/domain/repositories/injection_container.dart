import 'package:pasindu_sample_app/core/domain/repositories/impl/ticks_repository_impl.dart';

import 'package:get_it/get_it.dart';

Future<void>? setup(GetIt di) async {
  // Ticks Repository Impl
  di.registerLazySingleton<TicksRepositoryImpl>(
      () => TicksRepositoryImpl(socketDataSource: di()));
}
