import 'package:flutter_modular/flutter_modular.dart';

import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/presenter.dart';

class MovieDetailModular extends Module {
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const FilmListPage())];

  @override
  List<Bind<Object>> get binds => [
        Bind<IGeneralRemoteDatasource>((i) => GeneralRemoteClient()),
        Bind<IGeneralRemoteRepositoryRequest>(
            (i) => GeneralRemoteRepositoryRequest(i())),
        Bind<IRequestFilmList>((i) => RequestFilmList(
            repository: i(),
            url: "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies")),
        Bind<FilmListStore>((i) => FilmListStore(i())),
      ];
}
