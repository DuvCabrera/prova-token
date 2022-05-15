import 'package:mobx/mobx.dart';
import '../../domain/domain.dart';
import '../../features/features.dart';
part 'movie_detail_store.g.dart';

class MovieDetailStore = _MovieDetailStoreBase with _$MovieDetailStore;

abstract class _MovieDetailStoreBase with Store {
  final IRequestMovieDetail client;
  final ISaveMovieDetail saveMovie;
  final FavoriteFromMovieDetailStore favoriteStore;

  _MovieDetailStoreBase({
    required this.client,
    required this.saveMovie,
    required this.favoriteStore,
  });

  @observable
  LoadingStates loadingState = LoadingStates.loading;

  @observable
  bool isFavorite = false;

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
  Future<void> favoriteCheck(int id) async {
    final Map<String, dynamic> favoriteFromDb =
        await favoriteStore.read.readFavorite(id);
    if (favoriteFromDb.isEmpty) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
  }

  @action
  Future<void> onLikeIt() async {
    if (isFavorite) {
      await _deleteFavorite(movieDetail.id);
      isFavorite = false;
    } else {
      await _saveFavorite(movieDetail);
      isFavorite = true;
    }
  }

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

  Future<void> _saveFavorite(MovieDetail entity) async {
    final Map<String, dynamic> data = _favoriteMapConverter(entity);
    await favoriteStore.create.createFavorite(data);
  }

  Future<void> _deleteFavorite(int id) async {
    await favoriteStore.delete.deleteFavorite(id);
  }

  Map<String, dynamic> _favoriteMapConverter(MovieDetail entity) {
    return {
      'id': entity.id,
      'title': entity.title,
      'poster_url': entity.posterUrl,
      'genres': entity.genres.toString(),
    };
  }
}
