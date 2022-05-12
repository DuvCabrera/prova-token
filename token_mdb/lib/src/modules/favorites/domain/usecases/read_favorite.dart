import 'package:token_mdb/src/modules/modules.dart';

abstract class IReadFavorite {
  Future<List<Favorite>> getFavorite(int? id);
}
