import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/games/models/game_model.dart';
import 'package:flutter_bloc_example/games/pages/bloc/game_states.dart';
import 'package:flutter_bloc_example/games/repository/games_repository.dart';

import 'game_events.dart';

class GameBloc extends Bloc<EventGames, StateGames> {
  final GamesRepository repository;
  GameBloc(this.repository) : super(LoadingStateGames()) {
    on<GetGamesEvent>(
      (event, emit) async {
        try {
          List<GameModel> games = await repository.getGames();

          emit(SuccessStateGames(games));
        } on Exception {
          emit(ErrorStateGames(
            "Could not fetch the list, please try again later!",
          ));
        }
      },
    );
  }
}
