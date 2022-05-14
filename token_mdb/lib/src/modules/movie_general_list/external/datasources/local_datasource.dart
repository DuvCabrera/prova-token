abstract class IGeneralLocalDatasource {
  Future<void> saveMovieListOnLocalDatabase(
      {required String tableName, required List<Map<String, dynamic>> data});

  Future<List<Map<String, dynamic>>> getMovieListFromLocalDatabase(
      String tableName);
}
