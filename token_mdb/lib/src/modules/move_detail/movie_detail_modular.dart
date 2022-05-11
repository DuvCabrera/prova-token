import 'package:flutter_modular/flutter_modular.dart';

import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';

class MovieGeneralInformationModular extends Module {
  // @override
  // List<ModularRoute> get routes =>
  //     [ChildRoute('/', child: (context, args) => const FilmListPage())];

  @override
  List<Bind<Object>> get binds => [
        Bind<IRemoteDatasource>((i) => RemoteClient()),
        Bind<IRemoteRepositoryRequest>((i) => RemoteRepositoryRequest(i())),
        Bind<IRequestMovieDetail>((i) => RequestMovieDetail(
            repository: i(),
            url: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/")),
        // Bind<FilmListStore>((i) => FilmListStore(i())),
      ];
}
