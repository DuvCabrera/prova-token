import 'package:flutter_modular/flutter_modular.dart';

import '../database/database.dart';

import 'domain/domain.dart';
import 'infra/infra.dart';
import 'external/external.dart';
import 'presenter/presenter.dart';

class FavoritesModular extends Module {
  @override
  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (context, args) => const FavoritePage())];

  @override
  List<Bind> get binds => [
        Bind<ILocalDatasource>((i) => LocalStorage(read: i(), delete: i())),
        Bind<ILocalRepository>((i) => LocalRepository(i())),
        Bind<IReadFavorite>(
            (i) => ReadFavorite(tableName: 'favorite', repository: i())),
        Bind<IDeleteFavorite>(
            (i) => DeleteFavorite(repository: i(), tableName: 'favorite')),
        Bind<FavoriteStore>((i) => FavoriteStore(delete: i(), read: i())),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
