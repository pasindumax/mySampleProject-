import 'package:dartz/dartz.dart';
import 'package:pasindu_sample_app/core/domain/entities/ticks_sync.dart';
import 'package:pasindu_sample_app/helpers/error_handling/error.dart';

abstract class TicksRepository {
  Future<Either<Error, bool?>> sendRecordsToSocket(TicksSync ticksSync);
}
