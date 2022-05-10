import 'package:token_mdb/src/domain/domain.dart';
import 'package:token_mdb/src/infra/infra.dart';

class RequestFilmList extends IRequestFilmList {
  final IRemoteRepository repository;

  RequestFilmList(this.repository);

  @override
  Future<List<MovieGeneralInformation>> getFromApi() async {
    final List<Map<String, dynamic>> result =
        await repository.getFromExternal();
    List<MovieGeneralInformation> movieList = [];
    for (var film in result) {
      final MovieGeneralInformation movie =
          MovieGeneralInformationModel.fromJson(film);
      movieList.add(movie);
    }
    return movieList;
  }
}

abstract class IRemoteRepository {
  Future<List<Map<String, dynamic>>> getFromExternal();
}
