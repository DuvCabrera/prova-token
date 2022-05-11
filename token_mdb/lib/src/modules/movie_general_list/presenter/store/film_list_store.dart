import 'package:mobx/mobx.dart';

import '../../domain/domain.dart';

part 'film_list_store.g.dart';

class FilmListStore = _FilmListStoreBase with _$FilmListStore;

abstract class _FilmListStoreBase with Store {
  final IRequestFilmList client;

  _FilmListStoreBase(this.client);

  @observable
  List<MovieGeneralInformation> movieList = [];

  @computed
  List<MovieGeneralInformation> get filmList => movieList;

  @action
  Future<void> getFilms() async {
    movieList = await client.getFromApi();
    print(movieList);
  }
}
