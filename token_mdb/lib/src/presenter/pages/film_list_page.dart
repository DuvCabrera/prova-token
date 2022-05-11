import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/presenter/presenter.dart';

class FilmListPage extends StatefulWidget {
  const FilmListPage({Key? key}) : super(key: key);

  @override
  State<FilmListPage> createState() => _FilmListPageState();
}

class _FilmListPageState extends ModularState<FilmListPage, FilmListStore> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Observer(builder: (context) {
          if (store.filmList.isEmpty) {
            store.getFilms();
            return const CircularProgressIndicator();
          } else {
            return Container(
              color: Colors.blue,
            );
          }
        }),
        height: size.height,
      ),
    );
  }
}
