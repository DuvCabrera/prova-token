import 'dart:convert';

import '../../infra/infra.dart';
import '../datasources/datasources.dart';

class GeneralRemoteRepositoryRequest extends IGeneralRemoteRepositoryRequest {
  final IGeneralRemoteDatasource datasource;

  GeneralRemoteRepositoryRequest(this.datasource);
  @override
  Future<List<Map<String, dynamic>>> getFromExternal(String url) async {
    final String result = await datasource.getJsonFromApi(url);
    final jsonList = jsonDecode(result);
    return jsonList.cast<Map<String, dynamic>>();
  }
}
