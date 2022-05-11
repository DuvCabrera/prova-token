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
}
