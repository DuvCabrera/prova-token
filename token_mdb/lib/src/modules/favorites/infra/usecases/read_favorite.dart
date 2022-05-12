import '../../domain/domain.dart';
import '../infra.dart';

class ReadFavorite extends IReadFavorite {
  final String tableName;
  final ILocalRepository repository;

  ReadFavorite({required this.tableName, required this.repository});
  @override
  Future<List<Favorite>> getFavorite(int? id) async {
    final List<Map<String, dynamic>> result = await repository
        .getFavoriteFromLocalRepository(tableName: tableName, id: id);
    final List<Favorite> favoriteList = [];
    for (var favorite in result) {
      final favoriteInList = FavoriteModel.fromJson(favorite);
      favoriteList.add(favoriteInList);
    }
    return favoriteList;
  }
}
