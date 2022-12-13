import 'package:get_it/get_it.dart';
import 'package:pasindu_sample_app/features/onboarding/injection_container.dart'
    as onboarding_di;
import 'package:pasindu_sample_app/features/price_tracker/injection_container.dart'
    as route_orders_di;

Future<void>? setup(GetIt di) async {
  onboarding_di.setup(di);
  route_orders_di.setup(di);
}
