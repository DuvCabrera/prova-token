abstract class IRemoteRepositoryRequest {
  Future<Map<String, dynamic>> getFromExternal(String url);
}
