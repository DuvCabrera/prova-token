import 'dart:convert';

import 'package:token_mdb/src/infra/infra.dart';

import '../datasources/datasources.dart';

class RemoteRepositoryRequest extends IRemoteRepositoryRequest {
  final IRemoteDatasource datasource;

  RemoteRepositoryRequest(this.datasource);
  @override
  Future<List<Map<String, dynamic>>> getFromExternal(String url) async {
    final String result = await datasource.getJsonFromApi(url);
    return jsonDecode(result);
  }
}
