import '../../infra/infra.dart';
import '../external.dart';

class CreateFavoriteToMovieDetail extends ICreateFavoriteToMovieDetail {
  final IFavoriteLocalDatasource datasouce;

  CreateFavoriteToMovieDetail(this.datasouce);
  @override
  Future<void> createFavorite(
      {required Map<String, dynamic> data, required String tableName}) async {
    await datasouce.createFavoriteOnDatabase(data: data, tableName: tableName);
  }
}
