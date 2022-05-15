import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class CardGeneralWidget extends StatelessWidget {
  const CardGeneralWidget({Key? key, required this.size, required this.movie})
      : super(key: key);
  final Size size;
  final MovieGeneralInformation movie;

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
                          'Image not found',
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
