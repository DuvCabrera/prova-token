import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/modules.dart';

class AppModular extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: MovieGeneralInformationModular()),
        ModuleRoute("/movie-detail", module: MovieDetailModular()),
        ModuleRoute('/site-imdb', module: SiteImdbModular()),
        ModuleRoute('/favorite', module: FavoritesModular()),
      ];

  @override
  List<Module> get imports => [DataBaseModular()];
}
