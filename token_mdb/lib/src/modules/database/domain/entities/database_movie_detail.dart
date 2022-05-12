class DataBaseMovieDetail {
  final int id;
  final int budget;
  final List<String> genres;
  final String imdbId;
  final String overview;
  final int popularity;
  final String posterUrl;
  final Map<String, dynamic> productionCompanies;
  final String productionCountries;
  final String releaseDate;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  DataBaseMovieDetail(
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
}
