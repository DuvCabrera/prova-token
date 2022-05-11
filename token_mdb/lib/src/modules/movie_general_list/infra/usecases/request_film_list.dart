import '../../domain/domain.dart';
import '../infra.dart';

class RequestFilmList extends IRequestFilmList {
  final IRemoteRepositoryRequest repository;
  final String url;
  RequestFilmList({required this.repository, required this.url});

  @override
  Future<List<MovieGeneralInformation>> getFromApi() async {
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
