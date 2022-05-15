import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          return SizedBox(
            height: size.height,
            child: ListView.builder(
              itemCount: store.favoriteList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child:
                      CardWidgets(size: size, movie: store.favoriteList[index]),
                  onTap: () => Modular.to.pushNamed('/movie-detail',
                      arguments: store.favoriteList[index].id),
                );
              },
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
    return Container(
      color: Colors.black,
      height: size.height * 0.35,
      width: size.width,
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      child: Card(
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
            SizedBox(
              width: size.width * 0.65,
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
