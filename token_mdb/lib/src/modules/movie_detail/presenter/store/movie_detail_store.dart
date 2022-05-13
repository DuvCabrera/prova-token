import 'package:mobx/mobx.dart';
import 'package:token_mdb/src/modules/movie_detail/domain/domain.dart';
part 'movie_detail_store.g.dart';

class MovieDetailStore = _MovieDetailStoreBase with _$MovieDetailStore;

abstract class _MovieDetailStoreBase with Store {
  final IRequestMovieDetail client;

  _MovieDetailStoreBase(this.client);

  @observable
  MovieDetail movieDetail = MovieDetail(
      id: 0,
      budget: 1,
      genres: [],
      imdbId: "",
      overview: "",
      popularity: 1,
      posterUrl: "",
      productionCompanies: {},
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
    final movie = await client.getFromApi(id.toString());
    movieDetail = movie;
  }
}
