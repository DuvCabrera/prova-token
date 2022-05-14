import '../../domain/domain.dart';
import '../infra.dart';

class CreateFavoriteFromMovieDetail extends ICreateFavoriteFromMovieDetail {
  final ICreateFavoriteToMovieDetail repository;
  final String tableName;

  CreateFavoriteFromMovieDetail(
      {required this.repository, required this.tableName});

  @override
  Future<void> createFavorite(Map<String, dynamic> data) async {
    await repository.createFavorite(data: data, tableName: tableName);
  }
}
