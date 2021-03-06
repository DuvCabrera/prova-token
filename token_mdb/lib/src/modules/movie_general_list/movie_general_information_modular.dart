import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/core/core.dart';
import 'package:token_mdb/src/modules/database/database_modular.dart';

import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/presenter.dart';

class MovieGeneralInformationModular extends Module {
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const FilmListPage())];

  @override
  List<Bind<Object>> get binds => [
        //External
        Bind<IGeneralRemoteDatasource>((i) => GeneralRemoteClient()),
        Bind<IGeneralLocalDatasource>((i) => LocalDatabase(i())),

        //Infra
        Bind<ILocalRepositoryRequest>((i) => LocalRepositoryRequest(i())),
        Bind<ILocalSaveRepository>((i) => LocalSaveRepository(i())),
        Bind<IGeneralRemoteRepositoryRequest>(
            (i) => GeneralRemoteRepositoryRequest(i())),

        //Domain
        Bind<ISaveFilmList>((i) => SaveFilmList(
            tableName: TableNames.movieGeneralTableName, saveRequest: i())),
        Bind<IRequestFilmList>((i) => RequestFilmList(
            remoteRepository: i(),
            url: UrlConstants.apiGeneralInformationUrl,
            localRepository: i(),
            tableName: TableNames.movieGeneralTableName)),
        Bind<FilmListStore>((i) => FilmListStore(client: i(), saveFilme: i())),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
