import '../domain.dart';

abstract class IRequestMovieDetail {
  Future<MovieDetail> getFromApi(String id);
}
