class GameModel {
  final int id;
  final String name;
  final String backgroundImage;
  final double rating;

  GameModel({
    required this.id,
    required this.name,
    required this.backgroundImage,
    required this.rating,
  });
  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      backgroundImage: json['background_image'],
      id: json['id'],
      rating: json['rating'],
      name: json['name'],
    );
  }
}
