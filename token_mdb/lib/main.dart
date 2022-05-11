import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'src/movie_general_information_modular.dart';
import 'src/presenter/pages/pages.dart';

void main() {
  runApp(ModularApp(module: MovieGeneralInformationModular(), child: MyApp()));
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
