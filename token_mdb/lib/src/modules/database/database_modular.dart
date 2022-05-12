import 'package:flutter_modular/flutter_modular.dart';

import 'external/external.dart';
import 'domain/domain.dart';
import 'infra/infra.dart';

class DataBaseModular extends Module {
  @override
  List<Bind<Object>> get binds => [
        // External
        Bind<IDataBaseAdapter>((i) => DatabaseAdapter(), export: true),

        // Infra
        Bind<IDataBaseRepository>((i) => DataBaseRepository(database: i()),
            export: true),

        // Domain
        Bind<ICreate>((i) => Create(repository: i()), export: true),
        Bind<IDelete>((i) => Delete(repository: i()), export: true),
        Bind<IRead>((i) => Read(repository: i()), export: true),
        Bind<IUpdate>((i) => Update(repository: i()), export: true),
      ];
}
