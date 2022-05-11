abstract class IUpdate {
  Future<void> update(
      {required String tableName,
      required Map<String, dynamic> data,
      required int id});
}
