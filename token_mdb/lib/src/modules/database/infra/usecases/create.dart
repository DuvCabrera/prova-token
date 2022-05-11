import '../../domain/domain.dart';

import '../repositories/repositories.dart';

class Create implements ICreate {
  final IDataBaseRepository repository;

  Create({required this.repository});

  @override
  Future<void> create(
      {required String tableName, required Map<String, dynamic> data}) async {
    await repository.create(tableName: tableName, data: data);
  }
}
