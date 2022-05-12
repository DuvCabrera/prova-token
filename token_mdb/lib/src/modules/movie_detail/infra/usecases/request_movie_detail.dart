import 'package:token_mdb/src/modules/movie_detail/movie_detail.dart';

class RequestMovieDetail extends IRequestMovieDetail {
  final String url;
  final IRemoteRepositoryRequest repository;

  RequestMovieDetail({required this.url, required this.repository});
  @override
  Future<MovieDetail> getFromApi(String id) async {
    final Map<String, dynamic> result =
        await repository.getFromExternal(url + id);
    final MovieDetail movieDetail = MovieDetailModel.fromJson(result);
    return movieDetail;
  }
}
