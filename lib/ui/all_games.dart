import 'package:demomobxprovider/models/game_model.dart';
import 'package:demomobxprovider/stores/all_games_store.dart';
import 'package:demomobxprovider/widgets/game_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AllGamesScreen extends StatefulWidget {
  const AllGamesScreen({Key? key}) : super(key: key);

  @override
  State<AllGamesScreen> createState() => _AllGamesScreenState();
}

class _AllGamesScreenState extends State<AllGamesScreen> {
  late AllGamesStore _allGamesStore;

  @override
  void initState() {
    super.initState();

    _allGamesStore = context.read<AllGamesStore>();
    _allGamesStore.getGamesFrmApi();
  }

  @override
  Widget build(BuildContext context) {
    final observerStatus = _allGamesStore.allGamesListFuture;

    return Scaffold(
        appBar: AppBar(
          title: const Text('All Games'),
        ),
        body: Observer(
          builder: (_) {
            debugPrint('testAPI:${observerStatus.status}');

            switch (observerStatus.status) {
              case FutureStatus.pending:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case FutureStatus.rejected:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'Failed to load Game Items',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                );
              case FutureStatus.fulfilled:
                final List<GameData> gameDataList =
                    observerStatus.value as List<GameData>;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: gameDataList.length,
                    itemBuilder: (context, index) {
                      final gameData = gameDataList[index];
                      return GameItem(gameData: gameData);
                    },
                  ),
                );
            }
          },
        ));
  }
}
