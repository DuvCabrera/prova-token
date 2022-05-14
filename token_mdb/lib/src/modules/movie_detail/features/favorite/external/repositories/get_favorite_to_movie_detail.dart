import '../../infra/infra.dart';
import '../external.dart';

class GetFavoriteToMovieDetail extends IGetFavoriteToMovieDetail {
  final IFavoriteLocalDatasource datasource;

  GetFavoriteToMovieDetail(this.datasource);
  @override
  Future<Map<String, dynamic>> getFavorite(
      {required int id, required String tableName}) async {
    return await datasource.getFavoriteFromDatabase(
        tableName: tableName, id: id);
  }
}
