import '../../domain/domain.dart';
import '../repositories/repositories.dart';

class Delete implements IDelete {
  final IDataBaseRepository repository;

  Delete({required this.repository});

  @override
  Future<void> delete({required String tableName, int? id}) async {
    await repository.delete(tableName: tableName, id: id);
  }
}
