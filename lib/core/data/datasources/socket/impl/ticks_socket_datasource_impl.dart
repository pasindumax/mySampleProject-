import 'package:pasindu_sample_app/core/data/datasources/socket/ticks_socket_datasource.dart';

import 'package:pasindu_sample_app/core/domain/entities/ticks_sync.dart';

import 'package:pasindu_sample_app/core/plugins/web_socket_manager/socket_manager.dart';

class TicksSocketDataSourceImpl extends TicksSocketDataSource {
  late final String classIdentifier = 'TicketsSocketDataSourceImpl';
  final SocketManager socketManager;

  TicksSocketDataSourceImpl({required this.socketManager});

  @override
  Future<bool?> sendRecordsToSocket(TicksSync ticksSync) async {
    try {
      return await socketManager.sendData(ticksSync.toJson());
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
