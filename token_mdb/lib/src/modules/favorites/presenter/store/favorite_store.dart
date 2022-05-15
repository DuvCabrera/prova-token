import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final IDeleteFavorite delete;
  final IReadFavorite read;

  _FavoriteStoreBase({required this.delete, required this.read});

  @observable
  LoadingState loadingState = LoadingState.loading;

  @observable
  List<Favorite> favorits = [];

  @computed
  List<Favorite> get favoriteList => favorits;

  @action
  Future<void> initFavorite() async {
    favorits = await read.getFavorite(null);
  }
}
