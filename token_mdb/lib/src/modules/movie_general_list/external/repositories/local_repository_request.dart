import '../../infra/infra.dart';
import '../external.dart';

class LocalRepositoryRequest extends ILocalRepositoryRequest {
  final IGeneralLocalDatasource datasource;

  LocalRepositoryRequest(this.datasource);
  @override
  Future<List<Map<String, dynamic>>> getMovieListFromLocal(
      String tableName) async {
    return await datasource.getMovieListFromLocalDatabase(tableName);
  }
}
