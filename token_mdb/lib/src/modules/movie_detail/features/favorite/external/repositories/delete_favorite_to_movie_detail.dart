import '../../infra/infra.dart';
import '../external.dart';

class DeleteFavoriteToMovieDetail extends IDeleteFavoriteToMovieDetail {
  final IFavoriteLocalDatasource datasource;

  DeleteFavoriteToMovieDetail(this.datasource);
  @override
  Future<void> deleteFavorite(
      {required int id, required String tableName}) async {
    await datasource.deleteFavoriteOnDatabase(id: id, tableName: tableName);
  }
}
