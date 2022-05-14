abstract class ILocalMovieDetailSaveRepository {
  Future<void> saveMovieDetailOnLocal(
      {required Map<String, dynamic> data, required String tableName});
}
