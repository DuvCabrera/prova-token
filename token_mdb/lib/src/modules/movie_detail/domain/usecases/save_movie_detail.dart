import '../entities/entities.dart';

abstract class ISaveMovieDetail {
  Future<void> saveMovieDetailOnLocalStorage(MovieDetail movie);
}
