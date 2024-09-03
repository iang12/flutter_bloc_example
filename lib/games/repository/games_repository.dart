import 'package:dio/dio.dart';

import '../models/game_model.dart';

class GamesRepository {
  final Dio dio;
  final String _apiKey = '';
  final String _baseUrl = 'https://api.rawg.io/api/games';

  GamesRepository(this.dio);

  Future<List<GameModel>> getGames() async {
    try {
      final response = await dio.get(
        _baseUrl,
        queryParameters: {
          'key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((game) => GameModel.fromJson(game))
            .toList();
      } else {
        throw Exception('Erro ao obter games: Código ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception('Erro ao fazer a requisição: ${dioError.message}');
    }
  }
}
