import 'package:get_it/get_it.dart';

import 'package:pasindu_sample_app/core/plugins/web_socket_manager/injection_container.dart'
    as socket_manager_di;

Future<void> setup(GetIt di) async {
  socket_manager_di.setup(di);
}
