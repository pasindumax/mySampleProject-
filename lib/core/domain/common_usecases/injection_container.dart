import 'package:get_it/get_it.dart';

import 'request_ticks/request_ticks.dart';

Future<void>? setup(GetIt di) async {
  //GET ACCESS TOKEN USECASE
  di.registerFactory(() => GetMasterDataUseCase(
        repository: di(),
        connectivityHelper: di(),
      ));
}
