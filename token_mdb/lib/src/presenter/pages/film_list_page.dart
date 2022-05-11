import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/presenter/presenter.dart';

import '../../domain/domain.dart';

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
  const CardWidget({Key? key, required this.size, required this.movie})
      : super(key: key);
  final Size size;
  final MovieGeneralInformation movie;

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: size.height * 0.2,
              child: Image.network(
                movie.posterUrl,
                fit: BoxFit.fill,
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
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20.0, bottom: 20),
            //   child: Icon(icon),
            // ),
          ],
        ),
      ),
    );
  }
}
