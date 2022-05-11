import '../../infra/infra.dart';
import '../datasources/datasources.dart';

class DataBaseRepository implements IDataBaseRepository {
  final IDataBaseAdapter database;

  DataBaseRepository({required this.database});

  @override
  Future<void> create(
      {required String tableName, required Map<String, dynamic> data}) async {
    await database.saveData(tableName: tableName, data: data);
  }

  @override
  Future<void> delete({required String tableName, int? id}) async {
    await database.removeData(tableName: tableName, id: id);
  }

  @override
  Future<List<Map<String, dynamic>>> read({required String tableName}) async {
    return await database.readData(tableName: tableName);
  }

  @override
  Future<void> update(
      {required String tableName,
      required Map<String, dynamic> data,
      required int id}) async {
    await database.updateData(tableName: tableName, data: data, id: id);
  }
}
