import 'package:token_mdb/src/modules/movie_general_list/domain/domain.dart';
import 'package:token_mdb/src/modules/movie_general_list/infra/infra.dart';

class SaveFilmList extends ISaveFilmList {
  final String tableName;
  final ILocalSaveRepository saveRequest;

  SaveFilmList({required this.tableName, required this.saveRequest});
  @override
  Future<void> saveFilmListOnLocalStorage(
      List<MovieGeneralInformation> movies) async {
    final List<Map<String, dynamic>> data =
        _fromMovieGeneralInformation(movies);
    await saveRequest.saveMovieListOnLocal(data: data, tableName: tableName);
  }

  List<Map<String, dynamic>> _fromMovieGeneralInformation(
      List<MovieGeneralInformation> list) {
    List<Map<String, dynamic>> movieMapList = [];
    for (var movie in list) {
      final movieFromModel =
          MovieGeneralInformationModel.fromEntity(movie).toMap();
      movieMapList.add(movieFromModel);
    }
    return movieMapList;
  }
}
