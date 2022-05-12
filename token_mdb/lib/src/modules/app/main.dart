import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/modules.dart';

void main() {
  runApp(ModularApp(module: AppModular(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
