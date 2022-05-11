import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/domain/domain.dart';
import 'package:token_mdb/src/external/external.dart';
import 'package:token_mdb/src/infra/infra.dart';

import 'presenter/presenter.dart';

class MovieGeneralInformationModular extends Module {
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const FilmListPage())];

  @override
  List<Bind<Object>> get binds => [
        Bind<IRemoteDatasource>((i) => RemoteClient()),
        Bind<IRemoteRepositoryRequest>((i) => RemoteRepositoryRequest(i())),
        Bind<IRequestFilmList>((i) => RequestFilmList(
            repository: i(),
            url: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies")),
        Bind<FilmListStore>((i) => FilmListStore(i())),
      ];
}
