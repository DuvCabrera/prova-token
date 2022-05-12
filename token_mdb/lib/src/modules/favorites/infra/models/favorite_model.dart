import '../../domain/domain.dart';

class FavoriteModel implements Favorite {
  @override
  final int id;
  @override
  final String title;
  @override
  final String posterUrl;
  @override
  final List<String> genres;

  FavoriteModel(
      {required this.id,
      required this.title,
      required this.posterUrl,
      required this.genres});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        id: json['id'],
        title: json['title'],
        posterUrl: json['poster_url'],
        genres: json['genres']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'poster_url': posterUrl,
      'genres': genres
    };
  }
}
