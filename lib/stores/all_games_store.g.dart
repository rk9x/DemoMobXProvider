// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_games_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllGamesStore on AllGamesStoreBase, Store {
  late final _$allGamesListFutureAtom =
      Atom(name: 'AllGamesStoreBase.allGamesListFuture', context: context);

  @override
  ObservableFuture<List<GameData>> get allGamesListFuture {
    _$allGamesListFutureAtom.reportRead();
    return super.allGamesListFuture;
  }

  @override
  set allGamesListFuture(ObservableFuture<List<GameData>> value) {
    _$allGamesListFutureAtom.reportWrite(value, super.allGamesListFuture, () {
      super.allGamesListFuture = value;
    });
  }

  late final _$AllGamesStoreBaseActionController =
      ActionController(name: 'AllGamesStoreBase', context: context);

  @override
  Future<dynamic> getGamesFrmApi() {
    final _$actionInfo = _$AllGamesStoreBaseActionController.startAction(
        name: 'AllGamesStoreBase.getGamesFrmApi');
    try {
      return super.getGamesFrmApi();
    } finally {
      _$AllGamesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allGamesListFuture: ${allGamesListFuture}
    ''';
  }
}
