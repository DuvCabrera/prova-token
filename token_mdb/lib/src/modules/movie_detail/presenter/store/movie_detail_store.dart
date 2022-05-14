import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
part 'movie_detail_store.g.dart';

class MovieDetailStore = _MovieDetailStoreBase with _$MovieDetailStore;

abstract class _MovieDetailStoreBase with Store {
  final IRequestMovieDetail client;
  final ISaveMovieDetail saveMovie;

  _MovieDetailStoreBase({required this.client, required this.saveMovie});

  @observable
  LoadingStates loadingState = LoadingStates.loading;

  @observable
  MovieDetail movieDetail = MovieDetail(
      id: 0,
      budget: 1,
      genres: [],
      imdbId: "",
      overview: "",
      popularity: 1,
      posterUrl: "",
      productionCountries: "",
      releaseDate: "",
      runtime: 1,
      tagline: '',
      title: '',
      voteAverage: 1.1,
      voteCount: 1);

  @computed
  MovieDetail get movieDetailtoShow => movieDetail;

  @action
  Future<void> getMovie(int id) async {
    loadingState = LoadingStates.loading;
    MovieDetail? movieFromExternal = await client.getFromLocalStore(id);
    if (movieFromExternal == null) {
      try {
        movieFromExternal = await client.getFromApi(id.toString());
        await saveMovie.saveMovieDetailOnLocalStorage(movieFromExternal);
        movieDetail = movieFromExternal;
        loadingState = LoadingStates.success;
      } catch (e) {
        loadingState = LoadingStates.error;
      }
    } else {
      movieDetail = movieFromExternal;
      loadingState = LoadingStates.success;
    }
  }
}
