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
movieList: ${movieList},
filmList: ${filmList}
    ''';
  }
}
