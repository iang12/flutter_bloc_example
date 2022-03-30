import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/games/repository/games_repository.dart';
import 'package:flutter_bloc_example/pages/home.dart';

import 'game_bloc_override.dart';
import 'games/pages/bloc/games_bloc.dart';
import 'games/pages/games_page.dart';

void main() async {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: GameBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(GamesRepository(Dio())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GamesPage(),
      ),
    );
  }
}
