abstract class ILocalMovieDetailDatasource {
  Future<void> saveMovieDetailOnLocalDatabase(
      {required String tableName, required Map<String, dynamic> data});

  Future<Map<String, dynamic>> getMovieDatailFromLocalDatabase(
      {required String tableName, required int id});
}
