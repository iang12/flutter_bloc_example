import 'package:dio/dio.dart';

import '../models/game_model.dart';

class GamesRepository {
  final Dio dio;
  GamesRepository(this.dio);

  Future<List<GameModel>> getGames() async {
    final queryParameters = <String, String>{
      'key': 'ddeb27a6c86240d98191fea67da7d447'
    };
    try {
      var response = await dio.get(
        'https://api.rawg.io/api/games',
        queryParameters: queryParameters,
      );

      var games = (response.data['results'] as List)
          .map(
            (game) => GameModel(
              backgroundImage: game['background_image'],
              id: game['id'],
              rating: game['rating'],
              name: game['name'],
            ),
          )
          .toList();
      return games;
    } catch (e) {
      throw Exception('Houve um Erro ao listr os games!');
    }
  }
}
