import '../../domain/domain.dart';
import '../infra.dart';

class ReadFavorite extends IReadFavorite {
  final String tableName;
  final ILocalRepository repository;

  ReadFavorite({required this.tableName, required this.repository});
  @override
  Future<List<Favorite>> getFavorite(int? id) async {
    try {
      final List<Map<String, dynamic>> result = await repository
          .getFavoriteFromLocalRepository(tableName: tableName, id: id);
      return fromDatabase(result);
    } catch (e) {
      throw Exception();
    }
  }

  List<Favorite> fromDatabase(List<Map<String, dynamic>> list) {
    final List<Favorite> favoriteList = [];
    for (var favorite in list) {
      final favoriteInList = FavoriteModel.fromJson(favorite);
      favoriteList.add(favoriteInList);
    }
    return favoriteList;
  }
}
