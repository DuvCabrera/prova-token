import 'package:http/http.dart';

import '../../external.dart';

class RemoteClient extends IRemoteDatasource {
  final Client client = Client();
  @override
  Future<String> getJsonFromApi(String url) async {
    try {
      final Response response = await client.get(Uri.parse(url));
      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
