abstract class IFavoriteLocalDatasource {
  Future<void> deleteFavoriteOnDatabase({
    required int id,
    required String tableName,
  });

  Future<void> createFavoriteOnDatabase({
    required Map<String, dynamic> data,
    required String tableName,
  });

  Future<Map<String, dynamic>> getFavoriteFromDatabase({
    required String tableName,
    required int id,
  });
}
