import 'package:flutter_modular/flutter_modular.dart';

import '../database/database.dart';
import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';

class FavoritesModular extends Module {
  @override
  List<Bind> get binds => [
        Bind<ILocalDatasource>((i) => LocalStorage(read: i(), delete: i())),
        Bind<ILocalRepository>((i) => LocalRepository(i())),
        Bind<IReadFavorite>(
            (i) => ReadFavorite(tableName: 'favorite', repository: i())),
        Bind<IDeleteFavorite>(
            (i) => DeleteFavorite(repository: i(), tableName: 'favorite')),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
