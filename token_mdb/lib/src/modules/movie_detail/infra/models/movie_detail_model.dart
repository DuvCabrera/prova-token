import 'dart:convert';

import 'package:token_mdb/src/modules/movie_detail/domain/domain.dart';

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
  final double popularity;
  @override
  final String posterUrl;
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
        genres: json["genres"].cast<String>(),
        imdbId: json["imdb_id"],
        overview: json['overview'],
        popularity: json['popularity'],
        posterUrl: json['poster_url'],
        productionCountries: json['production_countries'][0]['name'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        tagline: json['tagline'],
        title: json["title"],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
  factory MovieDetailModel.fromDb(Map<String, dynamic> json) {
    return MovieDetailModel(
        id: json['id'],
        budget: json['budget'],
        genres: json["genres"].split(','),
        imdbId: json["imdb_id"],
        overview: json['overview'],
        popularity: json['popularity'],
        posterUrl: json['poster_url'],
        productionCountries: json['production_countries'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        tagline: json['tagline'],
        title: json["title"],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  factory MovieDetailModel.fromEntity(MovieDetail entity) {
    return MovieDetailModel(
        id: entity.id,
        budget: entity.budget,
        genres: entity.genres,
        imdbId: entity.imdbId,
        overview: entity.overview,
        popularity: entity.popularity,
        posterUrl: entity.posterUrl,
        productionCountries: entity.productionCountries,
        releaseDate: entity.releaseDate,
        runtime: entity.runtime,
        tagline: entity.tagline,
        title: entity.title,
        voteAverage: entity.voteAverage,
        voteCount: entity.voteCount);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'budget': budget,
      "genres": genres.toString(),
      "imdb_id": imdbId,
      'overview': overview,
      'popularity': popularity,
      'poster_url': posterUrl,
      'production_countries': productionCountries,
      'release_date': releaseDate,
      'runtime': runtime,
      'tagline': tagline,
      "title": title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
