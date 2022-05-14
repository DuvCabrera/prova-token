import '../../infra/infra.dart';
import '../external.dart';

class LocalSaveRepository extends ILocalSaveRepository {
  final IGeneralLocalDatasource datasource;

  LocalSaveRepository(this.datasource);

  @override
  Future<void> saveMovieListOnLocal(
      {required List<Map<String, dynamic>> data,
      required String tableName}) async {
    await datasource.saveMovieListOnLocalDatabase(
        tableName: tableName, data: data);
  }
}
