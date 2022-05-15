// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteStore on _FavoriteStoreBase, Store {
  Computed<List<Favorite>>? _$favoriteListComputed;

  @override
  List<Favorite> get favoriteList => (_$favoriteListComputed ??=
          Computed<List<Favorite>>(() => super.favoriteList,
              name: '_FavoriteStoreBase.favoriteList'))
      .value;

  late final _$loadingStateAtom =
      Atom(name: '_FavoriteStoreBase.loadingState', context: context);

  @override
  LoadingState get loadingState {
    _$loadingStateAtom.reportRead();
    return super.loadingState;
  }

  @override
  set loadingState(LoadingState value) {
    _$loadingStateAtom.reportWrite(value, super.loadingState, () {
      super.loadingState = value;
    });
  }

  late final _$favoritsAtom =
      Atom(name: '_FavoriteStoreBase.favorits', context: context);

  @override
  List<Favorite> get favorits {
    _$favoritsAtom.reportRead();
    return super.favorits;
  }

  @override
  set favorits(List<Favorite> value) {
    _$favoritsAtom.reportWrite(value, super.favorits, () {
      super.favorits = value;
    });
  }

  late final _$initFavoriteAsyncAction =
      AsyncAction('_FavoriteStoreBase.initFavorite', context: context);

  @override
  Future<void> initFavorite() {
    return _$initFavoriteAsyncAction.run(() => super.initFavorite());
  }

  @override
  String toString() {
    return '''
loadingState: ${loadingState},
favorits: ${favorits},
favoriteList: ${favoriteList}
    ''';
  }
}
