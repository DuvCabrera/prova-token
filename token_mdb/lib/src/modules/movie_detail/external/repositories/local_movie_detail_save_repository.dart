import '../../infra/infra.dart';
import '../datasources/datasources.dart';

class LocalMovieDetailSaveRepository extends ILocalMovieDetailSaveRepository {
  final ILocalMovieDetailDatasource datasource;

  LocalMovieDetailSaveRepository(this.datasource);
  @override
  Future<void> saveMovieDetailOnLocal(
      {required Map<String, dynamic> data, required String tableName}) async {
    await datasource.saveMovieDetailOnLocalDatabase(
        tableName: tableName, data: data);
  }
}
