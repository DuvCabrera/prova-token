import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/modules.dart';

class AppModular extends Module {
  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const HomePage(), children: [
        //   ModuleRoute('/character', module: CharacterModular()),
        //   ModuleRoute('/favorite', module: FavoriteModular()),
        //   ModuleRoute('/film', module: FilmModular()),
        // ]),
        ModuleRoute('/', module: MovieGeneralInformationModular()),
        ModuleRoute("/movie-detail", module: MovieDetailModular()),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
