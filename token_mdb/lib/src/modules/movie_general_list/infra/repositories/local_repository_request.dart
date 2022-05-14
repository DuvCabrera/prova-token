abstract class ILocalRepositoryRequest {
  Future<List<Map<String, dynamic>>> getMovieListFromLocal(
    String tableName,
  );
}
