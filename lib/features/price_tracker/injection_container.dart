import 'package:get_it/get_it.dart';

import 'presentation/mobx/landing/price_tracker.store.dart';

Future<void> setup(GetIt di) async {
  //mobx
  di.registerFactory(() => PriceTrackerStore());
}
