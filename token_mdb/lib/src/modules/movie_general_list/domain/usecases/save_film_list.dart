import '../domain.dart';

abstract class ISaveFilmList {
  Future<void> saveFilmListOnLocalStorage(List<MovieGeneralInformation> movies);
}
