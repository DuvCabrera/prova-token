// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailStore on _MovieDetailStoreBase, Store {
  Computed<MovieDetail>? _$movieDetailtoShowComputed;

  @override
  MovieDetail get movieDetailtoShow => (_$movieDetailtoShowComputed ??=
          Computed<MovieDetail>(() => super.movieDetailtoShow,
              name: '_MovieDetailStoreBase.movieDetailtoShow'))
      .value;

  late final _$loadingStateAtom =
      Atom(name: '_MovieDetailStoreBase.loadingState', context: context);

  @override
  LoadingStates get loadingState {
    _$loadingStateAtom.reportRead();
    return super.loadingState;
  }

  @override
  set loadingState(LoadingStates value) {
    _$loadingStateAtom.reportWrite(value, super.loadingState, () {
      super.loadingState = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_MovieDetailStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$movieDetailAtom =
      Atom(name: '_MovieDetailStoreBase.movieDetail', context: context);

  @override
  MovieDetail get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetail value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$favoriteCheckAsyncAction =
      AsyncAction('_MovieDetailStoreBase.favoriteCheck', context: context);

  @override
  Future<void> favoriteCheck(int id) {
    return _$favoriteCheckAsyncAction.run(() => super.favoriteCheck(id));
  }

  late final _$onLikeItAsyncAction =
      AsyncAction('_MovieDetailStoreBase.onLikeIt', context: context);

  @override
  Future<void> onLikeIt() {
    return _$onLikeItAsyncAction.run(() => super.onLikeIt());
  }

  late final _$getMovieAsyncAction =
      AsyncAction('_MovieDetailStoreBase.getMovie', context: context);

  @override
  Future<void> getMovie(int id) {
    return _$getMovieAsyncAction.run(() => super.getMovie(id));
  }

  @override
  String toString() {
    return '''
loadingState: ${loadingState},
isFavorite: ${isFavorite},
movieDetail: ${movieDetail},
movieDetailtoShow: ${movieDetailtoShow}
    ''';
  }
}
