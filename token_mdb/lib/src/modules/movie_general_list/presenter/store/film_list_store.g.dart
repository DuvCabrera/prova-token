// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilmListStore on _FilmListStoreBase, Store {
  Computed<List<MovieGeneralInformation>>? _$filmListComputed;

  @override
  List<MovieGeneralInformation> get filmList => (_$filmListComputed ??=
          Computed<List<MovieGeneralInformation>>(() => super.filmList,
              name: '_FilmListStoreBase.filmList'))
      .value;

  late final _$errorAtom =
      Atom(name: '_FilmListStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadingStateAtom =
      Atom(name: '_FilmListStoreBase.loadingState', context: context);

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

  late final _$movieListAtom =
      Atom(name: '_FilmListStoreBase.movieList', context: context);

  @override
  List<MovieGeneralInformation> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(List<MovieGeneralInformation> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  late final _$getFilmsAsyncAction =
      AsyncAction('_FilmListStoreBase.getFilms', context: context);

  @override
  Future<void> getFilms() {
    return _$getFilmsAsyncAction.run(() => super.getFilms());
  }

  @override
  String toString() {
    return '''
error: ${error},
loadingState: ${loadingState},
movieList: ${movieList},
filmList: ${filmList}
    ''';
  }
}
