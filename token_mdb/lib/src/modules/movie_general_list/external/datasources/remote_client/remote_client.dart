import 'package:http/http.dart';

import '../../external.dart';

class GeneralRemoteClient extends IGeneralRemoteDatasource {
  final Client client = Client();
  @override
  Future<String> getJsonFromApi(String url) async {
    try {
      final Response response = await client.get(Uri.parse(url));
      if (response.statusCode > 300) {
        throw Exception();
      }
      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
