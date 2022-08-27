import 'package:demomobxprovider/network/dio_client.dart';
import 'package:demomobxprovider/network/repository/all_games_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(AllGamesRepository(getIt<DioClient>()));
}
