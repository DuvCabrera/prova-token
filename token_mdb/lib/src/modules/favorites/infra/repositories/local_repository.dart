abstract class ILocalRepository {
  Future<void> deleteFromLocalRepository(
      {required int id, required String tableName});

  Future<List<Map<String, dynamic>>> getFavoriteFromLocalRepository({
    required String tableName,
    int? id,
  });
}
