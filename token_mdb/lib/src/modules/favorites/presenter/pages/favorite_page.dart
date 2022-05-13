import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../presenter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ModularState<FavoritePage, FavoriteStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
            if (store.favoriteList.isEmpty) {
              store.initFavorite();
              return Container(
                  color: Colors.amber,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Loading',
                          style: TextStyle(fontSize: 24),
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 2),
                itemCount: store.favoriteList.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Text(store.favoriteList[index].title));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
