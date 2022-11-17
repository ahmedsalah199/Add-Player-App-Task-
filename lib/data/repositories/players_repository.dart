import 'package:dartz/dartz.dart';
import 'package:players/core/error/exceptions.dart';
import 'package:players/core/error/failures.dart';
import 'package:players/core/network/network_checker.dart';
import 'package:players/data/models/players_model.dart';

import '../data_source/posts_remote_data_sources.dart';

class PlayersRepository {
  final BaseRemoteDataSource baseRemoteDataSource;
  final BaseNetworkChecker networkChecker;

  PlayersRepository(
      {required this.baseRemoteDataSource, required this.networkChecker});

  Future<Either<Failures, List<PlayersModel>>> fetchAllPlayers() async {
    if (await networkChecker.isConnected) {
      try {
        var result = await baseRemoteDataSource.getAllPlayers();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
