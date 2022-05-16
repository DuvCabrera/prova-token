import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/core/core.dart';
import '../presenter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ModularState<FavoritePage, FavoriteStore> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.loadingState == LoadingState.loading) {
            store.initFavorite();
            return loadingScreen();
          }
          if (store.loadingState == LoadingState.error) {
            return errorScreen(store.error);
          }
          return Container(
            color: Colors.black,
            height: size.height,
            child: Column(
              children: [
                const AppBarWidget(title: 'Favorite', haveBackButton: true),
                SizedBox(
                  height: size.height * 0.89,
                  child: gridBuilder(
                    itemCount: store.favoriteList.length,
                    list: store.favoriteList,
                    size: size,
                    functionBuilder: ({size, item}) =>
                        CardWidgets(size: size, movie: item),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
