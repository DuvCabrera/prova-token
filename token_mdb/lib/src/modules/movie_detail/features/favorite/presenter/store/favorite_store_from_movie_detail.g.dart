// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store_from_movie_detail.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteFromMovieDetailStore
    on _FavoriteFromMovieDetailStoreBase, Store {
  late final _$favoriteAtom = Atom(
      name: '_FavoriteFromMovieDetailStoreBase.favorite', context: context);

  @override
  Map<String, dynamic> get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(Map<String, dynamic> value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  late final _$getFavoriteByIdAsyncAction = AsyncAction(
      '_FavoriteFromMovieDetailStoreBase.getFavoriteById',
      context: context);

  @override
  Future<void> getFavoriteById(int id) {
    return _$getFavoriteByIdAsyncAction.run(() => super.getFavoriteById(id));
  }

  late final _$deleteFavoriteByIdAsyncAction = AsyncAction(
      '_FavoriteFromMovieDetailStoreBase.deleteFavoriteById',
      context: context);

  @override
  Future<void> deleteFavoriteById(int id) {
    return _$deleteFavoriteByIdAsyncAction
        .run(() => super.deleteFavoriteById(id));
  }

  late final _$saveFavoriteAsyncAction = AsyncAction(
      '_FavoriteFromMovieDetailStoreBase.saveFavorite',
      context: context);

  @override
  Future<void> saveFavorite(Map<String, dynamic> data) {
    return _$saveFavoriteAsyncAction.run(() => super.saveFavorite(data));
  }

  @override
  String toString() {
    return '''
favorite: ${favorite}
    ''';
  }
}
