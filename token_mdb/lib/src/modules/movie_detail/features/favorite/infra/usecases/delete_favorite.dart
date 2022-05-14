import '../../domain/domain.dart';
import '../infra.dart';

class DeleteFavoriteFromMoveDetail extends IDeleteFavoriteFromMovieDetail {
  final IDeleteFavoriteToMovieDetail repository;
  final String tableName;

  DeleteFavoriteFromMoveDetail({
    required this.repository,
    required this.tableName,
  });

  @override
  Future<void> deleteFavorite(int id) async {
    await repository.deleteFavorite(id: id, tableName: tableName);
  }
}
