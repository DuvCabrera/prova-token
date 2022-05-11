import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/domain.dart';
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
        child: Observer(builder: (context) {
          if (store.filmList.isEmpty) {
            store.getFilms();
            return const CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: store.filmList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: CardWidget(size: size, movie: store.filmList[index]),
                  );
                });
          }
        }),
        height: size.height,
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget({Key? key, required this.size, required this.movie})
      : super(key: key);
  final Size size;
  final MovieGeneralInformation movie;

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    IconData icon = (isFavorite) ? Icons.favorite : Icons.favorite_border;
    return Container(
      height: size.height * 0.35,
      width: size.width,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: 8,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: size.height * 0.2,
                  width: size.width * 0.5,
                  child: imageTest(movie.posterUrl),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                    child: Icon(icon),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.65,
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageTest(String url) {
  try {
    return Image.network(
      url,
      fit: BoxFit.fill,
    );
  } catch (e) {
    return Image.network(
      "https://th.bing.com/th/id/OIP.AC9frN1qFnn-I2JCycN8fwHaEK?pid=ImgDet&rs=1",
      fit: BoxFit.fill,
    );
  }
}
