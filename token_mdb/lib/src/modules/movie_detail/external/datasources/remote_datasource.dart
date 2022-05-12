abstract class IRemoteDatasource {
  Future<String> getJsonFromApi(String url);
}
