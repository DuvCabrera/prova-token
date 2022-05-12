import 'dart:convert';

import 'package:token_mdb/src/modules/movie_detail/infra/infra.dart';

import '../external.dart';

class RemoteRepositoryRequest extends IRemoteRepositoryRequest {
  final IRemoteDatasource datasource;
  RemoteRepositoryRequest(this.datasource);

  @override
  Future<Map<String, dynamic>> getFromExternal(String url) async {
    final String result = await datasource.getJsonFromApi(url);
    final jsonList = jsonDecode(result);
    return jsonList.cast<Map<String, dynamic>>();
  }
}
