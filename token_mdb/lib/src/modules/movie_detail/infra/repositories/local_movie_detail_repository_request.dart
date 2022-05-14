abstract class ILocalMovieDetailRepositoryRequest {
  Future<Map<String, dynamic>> getMovieDatailFromLocal(
      {required String tableName, required int id});
}
