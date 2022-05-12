import 'package:token_mdb/src/modules/modules.dart';

class DeleteFavorite extends IDeleteFavorite {
  final ILocalRepository repository;
  final String tableName;

  DeleteFavorite({required this.repository, required this.tableName});
  @override
  Future<void> deleteFavorite(int id) async {
    await repository.deleteFromLocalRepository(id: id, tableName: tableName);
  }
}
