import '../../domain/domain.dart';

class MovieGeneralInformationModel implements MovieGeneralInformation {
  @override
  final int id;
  @override
  final double voteAverage;
  @override
  final String title;
  @override
  final String posterUrl;
  @override
  final List<String> genres;
  @override
  final String realeaseDate;

  MovieGeneralInformationModel({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.realeaseDate,
  });

  factory MovieGeneralInformationModel.fromEntity(
      MovieGeneralInformation entity) {
    return MovieGeneralInformationModel(
        id: entity.id,
        voteAverage: entity.voteAverage,
        title: entity.title,
        posterUrl: entity.posterUrl,
        genres: entity.genres,
        realeaseDate: entity.realeaseDate);
  }

  factory MovieGeneralInformationModel.fromJson(Map<String, dynamic> json) {
    return MovieGeneralInformationModel(
      id: json['id'],
      voteAverage: json['vote_average'],
      title: json['title'],
      posterUrl: json['poster_url'],
      genres: json['genres'].cast<String>(),
      realeaseDate: json['release_date'],
    );
  }
  factory MovieGeneralInformationModel.fromDb(Map<String, dynamic> json) {
    return MovieGeneralInformationModel(
      id: json['id'],
      voteAverage: json['vote_average'],
      title: json['title'],
      posterUrl: json['poster_url'],
      genres: json['genres'].split(','),
      realeaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vote_average': voteAverage,
      'title': title,
      'poster_url': posterUrl,
      'genres': genres.toString(),
      'release_date': realeaseDate,
    };
  }
}
