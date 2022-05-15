import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';

import '../presenter.dart';

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
        child: Observer(
          builder: (context) {
            if (store.loadingState == LoadingState.loading) {
              store.getFilms();
              return loadingScreen();
            }
            if (store.loadingState == LoadingState.error) {
              return errorScreen(store.error);
            }
            return Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(title: 'Home', haveBackButton: false),
                  SizedBox(
                    height: size.height * 0.89,
                    child: gridBuilder(
                      functionBuilder: ({size, item}) =>
                          CardGeneralWidget(size: size, movie: item),
                      itemCount: store.filmList.length,
                      list: store.filmList,
                      size: size,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        height: size.height,
      ),
    );
  }
}
