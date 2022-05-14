import '../domain.dart';

abstract class IRequestMovieDetail {
  Future<MovieDetail> getFromApi(String id);

  Future<MovieDetail?> getFromLocalStore(int id);
}
