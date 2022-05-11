abstract class IRemoteRepositoryRequest {
  Future<List<Map<String, dynamic>>> getFromExternal(String url);
}
