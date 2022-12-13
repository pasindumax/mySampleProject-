import 'package:pasindu_sample_app/core/domain/entities/ticks_sync.dart';

abstract class TicksSocketDataSource {
  Future<bool?> sendRecordsToSocket(TicksSync ticksSync);
}
