import 'package:demomobxprovider/di/service_locator.dart';
import 'package:demomobxprovider/network/repository/all_games_repository.dart';
import 'package:demomobxprovider/stores/all_games_store.dart';
import 'package:demomobxprovider/ui/all_games.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Load Env file from Assets
  await dotenv.load(fileName: "assets/.env");

  //Generate Class components
  await setUpServiceLocator();
  runApp(const DemoMobXProviderApp());
}

class DemoMobXProviderApp extends StatelessWidget {
  const DemoMobXProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AllGamesStore>(
          create: (_) => AllGamesStore(getIt<AllGamesRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AllGamesScreen(),
      ),
    );
  }
}
