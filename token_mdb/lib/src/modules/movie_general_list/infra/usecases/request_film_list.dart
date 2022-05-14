import '../../domain/domain.dart';
import '../infra.dart';

class RequestFilmList extends IRequestFilmList {
  final IGeneralRemoteRepositoryRequest remoteRepository;
  final ILocalRepositoryRequest localRepository;
  final String url;
  final String tableName;

  RequestFilmList({
    required this.remoteRepository,
    required this.url,
    required this.tableName,
    required this.localRepository,
  });

  @override
  Future<List<MovieGeneralInformation>> getFromApi() async {
    try {
      final List<Map<String, dynamic>> result =
          await remoteRepository.getFromExternal(url);
      return _fromListMap(result, false);
    } catch (error) {
      final List<Map<String, dynamic>> listFromLocal =
          await localRepository.getMovieListFromLocal(tableName);
      return _fromListMap(listFromLocal, false);
    }
  }

  @override
  Future<List<MovieGeneralInformation>> getFromLocalStore() async {
    try {
      final List<Map<String, dynamic>> listFromLocal =
          await localRepository.getMovieListFromLocal(tableName);
      return _fromListMap(listFromLocal, true);
    } catch (e) {
      return [];
    }
  }

  List<MovieGeneralInformation> _fromListMap(
      List<Map<String, dynamic>> list, bool fromDb) {
    List<MovieGeneralInformation> movieList = [];
    if (fromDb) {
      for (var movie in list) {
        final MovieGeneralInformation movieFromMap =
            MovieGeneralInformationModel.fromDb(movie);
        movieList.add(movieFromMap);
      }
    } else {
      for (var movie in list) {
        final MovieGeneralInformation movieFromMap =
            MovieGeneralInformationModel.fromJson(movie);
        movieList.add(movieFromMap);
      }
    }
    return movieList;
  }
}
