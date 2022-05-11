abstract class ICreate {
  Future<void> create(
      {required String tableName, required Map<String, dynamic> data});
}
