import 'package:token_mdb/src/modules/movie_detail/movie_detail.dart';

class RequestMovieDetail extends IRequestMovieDetail {
  final String url;
  final IRemoteRepositoryRequest repository;
  final ILocalMovieDetailRepositoryRequest localRepository;
  final String tableName;

  RequestMovieDetail({
    required this.url,
    required this.repository,
    required this.localRepository,
    required this.tableName,
  });
  @override
  Future<MovieDetail> getFromApi(String id) async {
    final Map<String, dynamic> result =
        await repository.getFromExternal(url + id);

    return _fromMap(result, false);
  }

  @override
  Future<MovieDetail?> getFromLocalStore(int id) async {
    final Map<String, dynamic> result = await localRepository
        .getMovieDatailFromLocal(tableName: tableName, id: id);
    if (result.isEmpty) {
      return null;
    }
    return _fromMap(result, true);
  }

  MovieDetail _fromMap(Map<String, dynamic> map, bool fromDb) {
    List<MovieDetail> movieList = [];
    if (fromDb) {
      final MovieDetail movieFromMap = MovieDetailModel.fromDb(map);
      movieList.add(movieFromMap);
    } else {
      final MovieDetail movieFromMap = MovieDetailModel.fromJson(map);
      movieList.add(movieFromMap);
    }

    return movieList[0];
  }
}
