import 'package:demomobxprovider/models/game_model.dart';
import 'package:demomobxprovider/network/constants/api_constants.dart';
import 'package:demomobxprovider/network/dio_client.dart';

class AllGamesRepository {
  final DioClient _dioClient;
  AllGamesRepository(this._dioClient);

  Future<List<GameData>> getAllGames() async {
    try {
      final res = await _dioClient.get(ApiConstant.allGames);
      return GameModel.fromJson(res).results ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
