abstract class ICreateFavoriteToMovieDetail {
  Future<void> createFavorite(
      {required Map<String, dynamic> data, required String tableName});
}
