import 'package:dartz/dartz.dart';
import 'package:pasindu_sample_app/core/data/datasources/socket/ticks_socket_datasource.dart';
import 'package:pasindu_sample_app/core/domain/entities/ticks_sync.dart';
import 'package:pasindu_sample_app/core/domain/repositories/ticks_resository.dart';
import 'package:pasindu_sample_app/helpers/error_handling/errors/socket_error.dart';
import 'package:pasindu_sample_app/helpers/error_handling/error.dart';

class TicksRepositoryImpl extends TicksRepository {
  final classIdentifier = 'TicksRepositoryImpl';
  late final TicksSocketDataSource socketDataSource;

  TicksRepositoryImpl({required this.socketDataSource});

  @override
  Future<Either<Error, bool?>> sendRecordsToSocket(TicksSync ticksSync) async {
    try {
      final response = await socketDataSource.sendRecordsToSocket(ticksSync);
      if (response == true) {
        return Right(response);
      } else {
        final error = SocketError(
            errorMessage: 'Data is not sent successfully',
            errorLocationId: Error.generateLocationId(
                classIdentifier, 'sendRecordsToSocket', 1));
        //await logger.logError(error);
        return Left(error);
      }
    } on Exception catch (e) {
      final error = SocketError(
          errorMessage: e.toString(),
          errorLocationId: Error.generateLocationId(
              classIdentifier, 'sendRecordsToSocket', 3));
      //await logger.logError(error);
      return Left(error);
    }
  }
}
