import '../../infra/infra.dart';
import '../datasources/datasources.dart';

class LocalMovieDetailRepositoryRequest
    extends ILocalMovieDetailRepositoryRequest {
  final ILocalMovieDetailDatasource datasource;

  LocalMovieDetailRepositoryRequest(this.datasource);
  @override
  Future<Map<String, dynamic>> getMovieDatailFromLocal(
      {required String tableName, required int id}) async {
    return await datasource.getMovieDatailFromLocalDatabase(
        tableName: tableName, id: id);
  }
}
