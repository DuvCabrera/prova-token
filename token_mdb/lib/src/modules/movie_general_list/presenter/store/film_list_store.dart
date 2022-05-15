import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../../domain/domain.dart';

part 'film_list_store.g.dart';

class FilmListStore = _FilmListStoreBase with _$FilmListStore;

abstract class _FilmListStoreBase with Store {
  final ISaveFilmList saveFilme;
  final IRequestFilmList client;

  _FilmListStoreBase({required this.client, required this.saveFilme});

  @observable
  String error = '';

  @observable
  LoadingState loadingState = LoadingState.loading;

  @observable
  List<MovieGeneralInformation> movieList = [];

  @computed
  List<MovieGeneralInformation> get filmList => movieList;

  @action
  Future<void> getFilms() async {
    loadingState = LoadingState.loading;
    List<MovieGeneralInformation> moviesFromExternal =
        await client.getFromLocalStore();
    if (moviesFromExternal.isEmpty) {
      try {
        moviesFromExternal = await client.getFromApi();
        await saveFilme.saveFilmListOnLocalStorage(moviesFromExternal);
        movieList = moviesFromExternal;
        loadingState = LoadingState.success;
      } catch (e) {
        error = e.toString();
        loadingState = LoadingState.error;
      }
    } else {
      movieList = moviesFromExternal;
      loadingState = LoadingState.success;
    }
  }
}
