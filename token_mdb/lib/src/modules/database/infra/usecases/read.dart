import '../../domain/domain.dart';

import '../repositories/repositories.dart';

class Read implements IRead {
  final IDataBaseRepository repository;

  Read({required this.repository});

  @override
  Future<List<Map<String, dynamic>>> get(
      {required String tableName, int? id}) async {
    final result = await repository.read(tableName: tableName, id: id);
    return result;
  }
}
