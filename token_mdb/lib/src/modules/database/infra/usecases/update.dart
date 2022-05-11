import '../../domain/domain.dart';
import '../repositories/repositories.dart';

class Update implements IUpdate {
  final IDataBaseRepository repository;

  Update({required this.repository});

  @override
  Future<void> update(
      {required String tableName,
      required Map<String, dynamic> data,
      required int id}) async {
    await repository.update(tableName: tableName, data: data, id: id);
  }
}
