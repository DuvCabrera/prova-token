import '../domain.dart';

abstract class IRequestFilmList {
  Future<List<MovieGeneralInformation>> getFromApi();
}
