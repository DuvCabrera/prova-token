import '../../domain/domain.dart';
import '../infra.dart';

class GetFavoriteFromMovieDetail extends IGetFavotire {
  final IGetFavoriteToMovieDetail repository;
  final String tableName;

  GetFavoriteFromMovieDetail({
    required this.repository,
    required this.tableName,
  });

  @override
  Future<Map<String, dynamic>> readFavorite(int id) async {
    return await repository.getFavorite(id: id, tableName: tableName);
  }
}
