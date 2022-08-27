import 'package:demomobxprovider/models/game_model.dart';
import 'package:demomobxprovider/network/repository/all_games_repository.dart';
import 'package:mobx/mobx.dart';

part 'all_games_store.g.dart';

class AllGamesStore = AllGamesStoreBase with _$AllGamesStore;

abstract class AllGamesStoreBase with Store {
  final AllGamesRepository _allGamesRepository;

  AllGamesStoreBase(AllGamesRepository allGamesRepository)
      : _allGamesRepository = allGamesRepository;

  @observable
  ObservableFuture<List<GameData>> allGamesListFuture =
      ObservableFuture(Future.value([]));

  @action
  Future getGamesFrmApi() =>
      allGamesListFuture = ObservableFuture(_allGamesRepository.getAllGames());
}
