import '../../../../../../modules.dart';

class FavoriteLocalDatabase extends IFavoriteLocalDatasource {
  final IRead read;
  final IDelete delete;
  final ICreate create;

  FavoriteLocalDatabase({
    required this.read,
    required this.delete,
    required this.create,
  });

  @override
  Future<void> createFavoriteOnDatabase(
      {required Map<String, dynamic> data, required String tableName}) async {
    await create.create(tableName: tableName, data: data);
  }

  @override
  Future<void> deleteFavoriteOnDatabase(
      {required int id, required String tableName}) async {
    await delete.delete(tableName: tableName, id: id);
  }

  @override
  Future<Map<String, dynamic>> getFavoriteFromDatabase(
      {required String tableName, required int id}) async {
    final List<Map<String, dynamic>> request =
        await read.get(tableName: tableName, id: id);
    if (request.isEmpty) {
      return {};
    }
    return request.firstWhere((element) => element['id'] == id);
  }
}
