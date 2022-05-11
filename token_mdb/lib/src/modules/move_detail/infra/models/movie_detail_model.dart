import 'package:token_mdb/src/modules/move_detail/domain/domain.dart';

class MovieDetailModel implements MovieDetail {
  @override
  final int id;
  @override
  final int budget;
  @override
  final List<String> genres;
  @override
  final String imdbId;
  @override
  final String overview;
  @override
  final int popularity;
  @override
  final String posterUrl;
  @override
  final Map<String, dynamic> productionCompanies;
  @override
  final String productionCountries;
  @override
  final String releaseDate;
  @override
  final int runtime;
  @override
  final String tagline;
  @override
  final String title;
  @override
  final double voteAverage;
  @override
  final int voteCount;

  MovieDetailModel(
      {required this.id,
      required this.budget,
      required this.genres,
      required this.imdbId,
      required this.overview,
      required this.popularity,
      required this.posterUrl,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.runtime,
      required this.tagline,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
        id: json['id'],
        budget: json['budget'],
        genres: json["genres"],
        imdbId: json["imdb_id"],
        overview: json['overview'],
        popularity: json['popularity'],
        posterUrl: json['poster_url'],
        productionCompanies: json['production_companies'],
        productionCountries: json['production_countries'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        tagline: json['tagline'],
        title: json["title"],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
