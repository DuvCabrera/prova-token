import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';

part 'favorite_store_from_movie_detail.g.dart';

class FavoriteFromMovieDetailStore = _FavoriteFromMovieDetailStoreBase
    with _$FavoriteFromMovieDetailStore;

abstract class _FavoriteFromMovieDetailStoreBase with Store {
  final ICreateFavoriteFromMovieDetail create;
  final IDeleteFavoriteFromMovieDetail delete;
  final IGetFavotire read;

  _FavoriteFromMovieDetailStoreBase({
    required this.create,
    required this.delete,
    required this.read,
  });

  @observable
  Map<String, dynamic> favorite = {};

  @action
  Future<void> getFavoriteById(int id) async {
    favorite = await read.readFavorite(id);
  }

  @action
  Future<void> deleteFavoriteById(int id) async {
    await delete.deleteFavorite(id);
  }

  @action
  Future<void> saveFavorite(Map<String, dynamic> data) async {
    await create.createFavorite(data);
  }
}
