import 'package:flutter_bloc_example/games/models/game_model.dart';

abstract class StateGames {}

class LoadingStateGames extends StateGames {}

class SuccessStateGames extends StateGames {
  final List<GameModel> games;

  SuccessStateGames(this.games);
}

class ErrorStateGames extends StateGames {
  final String error;

  ErrorStateGames(this.error);
}
