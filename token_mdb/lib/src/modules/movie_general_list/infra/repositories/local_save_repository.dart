abstract class ILocalSaveRepository {
  Future<void> saveMovieListOnLocal(
      {required List<Map<String, dynamic>> data, required String tableName});
}
