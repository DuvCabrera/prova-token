import 'package:http/http.dart';

import '../../external.dart';

class GeneralRemoteClient extends IGeneralRemoteDatasource {
  final Client client = Client();
  @override
  Future<String> getJsonFromApi(String url) async {
    final Response response = await client.get(Uri.parse(url));
    return response.body;
  }
}
