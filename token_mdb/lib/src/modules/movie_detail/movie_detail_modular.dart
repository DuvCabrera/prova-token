import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/database/database.dart';

import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/presenter.dart';

class MovieDetailModular extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => MovieDetailPage(movieId: args.data))
      ];

  @override
  List<Bind<Object>> get binds => [
        //External
        Bind<IRemoteDatasource>((i) => RemoteClient()),
        Bind<ILocalMovieDetailDatasource>(
            (i) => LocalMovieDetailDatasource(i())),

        //Infra
        Bind<IRemoteRepositoryRequest>((i) => RemoteRepositoryRequest(i())),
        Bind<ILocalMovieDetailSaveRepository>(
            (i) => LocalMovieDetailSaveRepository(i())),
        Bind<ILocalMovieDetailRepositoryRequest>(
            (i) => LocalMovieDetailRepositoryRequest(i())),
        //Domain
        Bind<ISaveMovieDetail>(
            (i) => SaveMovieDetail(tableName: 'moviedetail', saveRequest: i())),
        Bind<IRequestMovieDetail>((i) => RequestMovieDetail(
            repository: i(),
            url: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/",
            localRepository: i(),
            tableName: 'moviedetail')),
        Bind<MovieDetailStore>(
            (i) => MovieDetailStore(client: i(), saveMovie: i())),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
