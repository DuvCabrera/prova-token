import '../../domain/domain.dart';
import '../infra.dart';

class SaveMovieDetail extends ISaveMovieDetail {
  final String tableName;
  final ILocalMovieDetailSaveRepository saveRequest;

  SaveMovieDetail({required this.tableName, required this.saveRequest});

  @override
  Future<void> saveMovieDetailOnLocalStorage(MovieDetail movie) async {
    final Map<String, dynamic> data = _fromMovieDetail(movie);
    await saveRequest.saveMovieDetailOnLocal(data: data, tableName: tableName);
  }
}

Map<String, dynamic> _fromMovieDetail(MovieDetail map) {
  List<Map<String, dynamic>> movieMapList = [];
  final movieFromModel = MovieDetailModel.fromEntity(map).toMap();
  movieMapList.add(movieFromModel);

  return movieMapList[0];
}
