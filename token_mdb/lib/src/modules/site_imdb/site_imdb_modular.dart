import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/pages.dart';

class SiteImdbModular extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => SiteImdbPage(url: args.data)),
      ];
}
