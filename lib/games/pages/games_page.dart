import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/game_events.dart';
import 'bloc/game_states.dart';
import 'bloc/games_bloc.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  void initState() {
    BlocProvider.of<GameBloc>(context).add(GetGamesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games List'),
      ),
      body: BlocBuilder<GameBloc, StateGames>(
        builder: (_, state) {
          if (state is LoadingStateGames) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuccessStateGames) {
            return GridView.builder(
              itemCount: state.games.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                  crossAxisSpacing: 10.0),
              itemBuilder: (_, int index) {
                var game = state.games[index];
                return Card(
                  child: Image.network(game.backgroundImage),
                );
              },
            );
          }

          if (state is ErrorStateGames) {
            return Center(child: Text(state.error));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
