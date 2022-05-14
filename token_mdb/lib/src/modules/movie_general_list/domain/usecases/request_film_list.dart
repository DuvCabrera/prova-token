import '../domain.dart';

abstract class IRequestFilmList {
  Future<List<MovieGeneralInformation>> getFromApi();

  Future<List<MovieGeneralInformation>> getFromLocalStore();
}
