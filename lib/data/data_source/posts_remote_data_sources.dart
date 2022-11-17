import 'package:players/core/network/dio_helper.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/api_constants.dart';
import '../models/players_model.dart';

abstract class BaseRemoteDataSource {
  Future<List<PlayersModel>> getAllPlayers();
}

class RemoteDataSource implements BaseRemoteDataSource {
  final DioHelper dioHelper;
  RemoteDataSource({required this.dioHelper});
  @override
  Future<List<PlayersModel>> getAllPlayers() async {
    var response =
        await dioHelper.get(path: ApiConstants.userPath, query: {"limit": 10});
    List data = response.data["users"];
    if (response.statusCode == 200) {
      return List<PlayersModel>.from(
          data.map((player) => PlayersModel.fromJson(player)));
    } else {
      throw ServerException();
    }
  }
}
