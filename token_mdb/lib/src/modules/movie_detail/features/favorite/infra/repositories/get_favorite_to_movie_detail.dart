abstract class IGetFavoriteToMovieDetail {
  Future<Map<String, dynamic>> getFavorite({
    required int id,
    required String tableName,
  });
}
