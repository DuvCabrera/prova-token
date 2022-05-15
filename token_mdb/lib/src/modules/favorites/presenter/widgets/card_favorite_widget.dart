import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class CardFavoriteWidgets extends StatelessWidget {
  const CardFavoriteWidgets({Key? key, required this.size, required this.movie})
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
