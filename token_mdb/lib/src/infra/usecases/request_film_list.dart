import 'package:token_mdb/src/domain/domain.dart';
import 'package:token_mdb/src/infra/infra.dart';

class RequestFilmList extends IRequestFilmList {
  final IRemoteRepositoryRequest repository;

  RequestFilmList(this.repository);

  @override
  Future<List<MovieGeneralInformation>> getFromApi(String url) async {
    final List<Map<String, dynamic>> result =
        await repository.getFromExternal(url);
    List<MovieGeneralInformation> movieList = [];
    for (var film in result) {
      final MovieGeneralInformation movie =
          MovieGeneralInformationModel.fromJson(film);
      movieList.add(movie);
    }
    return movieList;
  }
}
