import 'package:dartz/dartz.dart';
import 'package:finap_connectivity_helper/finap_connectivity_helper.dart';

import 'package:pasindu_sample_app/config/features/domain/usecases/usecase.dart';

import 'package:pasindu_sample_app/core/domain/entities/ticks_sync.dart';

import 'package:pasindu_sample_app/core/domain/repositories/ticks_resository.dart';
import 'package:pasindu_sample_app/helpers/error_handling/error.dart';

class GetMasterDataUseCase extends UseCase<bool?, TicksSync> {
  late final TicksRepository repository;
  late final ConnectivityHelper connectivityHelper;
  GetMasterDataUseCase({
    required this.repository,
    required this.connectivityHelper,
  });

  @override
  Future<Either<Error, bool?>> call(TicksSync params) async {
    final isConnected = await connectivityHelper.isConnected();
    if (isConnected) {
      return await repository.sendRecordsToSocket(params);
    } else {
      throw Exception('Please connect to active internet connection');
    }
  }
}
