import 'package:token_mdb/src/domain/domain.dart';

abstract class IRequestFilmList {
  Future<List<MovieGeneralInformation>> getFromApi(String url);
}
