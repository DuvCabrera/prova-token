import 'package:flutter_modular/flutter_modular.dart';

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
        Bind<IRemoteDatasource>((i) => RemoteClient()),
        Bind<IRemoteRepositoryRequest>((i) => RemoteRepositoryRequest(i())),
        Bind<IRequestMovieDetail>((i) => RequestMovieDetail(
            repository: i(),
            url: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/")),
        Bind<MovieDetailStore>((i) => MovieDetailStore(i())),
      ];
}
