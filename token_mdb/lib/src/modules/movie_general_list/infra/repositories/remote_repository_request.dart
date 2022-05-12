abstract class IGeneralRemoteRepositoryRequest {
  Future<List<Map<String, dynamic>>> getFromExternal(String url);
}
