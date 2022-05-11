class DatabaseMovieGeneralInformation {
  final int id;
  final double voteAverage;
  final String title;
  final String posterUrl;
  final List<String> genres;
  final String realeaseDate;

  DatabaseMovieGeneralInformation({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.realeaseDate,
  });
}
