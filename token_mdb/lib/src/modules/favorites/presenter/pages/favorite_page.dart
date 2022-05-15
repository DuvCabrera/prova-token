import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/core/core.dart';

import '../../domain/domain.dart';
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
          store.initFavorite();
          if (store.favoriteList.isEmpty) {
            return Container(
              color: Colors.amber,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Loading ',
                      style: TextStyle(fontSize: 24),
                    ),
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
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
                    functionBuilder: ({size, item}) => CardWidgets(
                      size: size,
                      movie: item,
                    ),
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

class CardWidgets extends StatelessWidget {
  const CardWidgets({Key? key, required this.size, required this.movie})
      : super(key: key);
  final Size size;
  final Favorite movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: size.height * 0.2,
                  width: size.width - 32,
                  child: Image.network(
                    movie.posterUrl,
                    fit: BoxFit.fill,
                    errorBuilder: (context, _, __) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.error,
                            size: 36,
                          ),
                          Text(
                            'Imagem não encontrada',
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: size.height * 0.1,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              color: Colors.black.withOpacity(1)),
        ),
        Positioned(
          bottom: 3,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: size.width * 0.65,
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
