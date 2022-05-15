import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
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
        child: Observer(
          builder: (context) {
            if (store.loadingState == LoadingState.loading) {
              store.getFilms();
              return Container(
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0, right: 36),
                        child: Text(
                          'Conecte-se à Internet',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Carregando Dados ',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            if (store.loadingState == LoadingState.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Erro no carregamento dos dados. Por favor, tente novamente.',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Modular.to.popAndPushNamed('/');
                      },
                      child: const Text(
                        'Tente novamente',
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: ElevatedButton(
                      onPressed: () => Modular.to.pushNamed('/favorite'),
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text(
                        'Favoritos',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.89,
                    child: ListView.builder(
                      itemCount: store.filmList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Modular.to.pushNamed('/movie-detail',
                                arguments: store.filmList[index].id);
                          },
                          child: CardWidget(
                              size: size, movie: store.filmList[index]),
                        );
                      },
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

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.size, required this.movie})
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
