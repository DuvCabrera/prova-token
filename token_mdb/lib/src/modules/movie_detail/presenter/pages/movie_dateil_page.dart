import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/movie_detail/movie_detail.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState
    extends ModularState<MovieDetailPage, MovieDetailStore> {
  final textColor = const Color.fromARGB(226, 209, 204, 204);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        child: Observer(
          builder: (context) {
            if (store.loadingState == LoadingStates.loading) {
              store.getMovie(widget.movieId);
              return Container(
                color: Colors.amber,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Loading ',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            }
            if (store.loadingState == LoadingStates.error) {
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
                        Modular.to.popAndPushNamed('/movie-detail',
                            arguments: widget.movieId);
                      },
                      child: const Text(
                        'Tente novamente',
                      ),
                    ),
                  ],
                ),
              );
            }
            MovieDetail movie = store.movieDetailtoShow;
            return Container(
              height: size.height,
              width: size.width,
              color: const Color.fromARGB(255, 14, 13, 13),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.35,
                      width: size.width,
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
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(
                            5.0,
                            5.0,
                          ), //Offset
                          blurRadius: 50.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 16),
                                    child: Text(movie.title,
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      'COUNTRY OF PRODUCTION',
                                      style: TextStyle(
                                          color: textColor, fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Text(movie.productionCountries,
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                        'Released :${movie.releaseDate}',
                                        style: TextStyle(
                                            color: textColor, fontSize: 20)),
                                  ),
                                  Text(
                                      'Duration: ${movie.runtime.toString()} MIN',
                                      style: TextStyle(
                                          color: textColor, fontSize: 18)),
                                ],
                              ),
                            ),
                            Image.network(
                              movie.posterUrl,
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
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'GENRES',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(226, 209, 204, 204),
                                  ),
                                ),
                                Row(
                                  children: setGenres(movie.genres, textColor),
                                ),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(),
                              height: size.height * 0.1,
                              child: GestureDetector(
                                child: Image.asset('images/IMDB.png'),
                                onTap: () {
                                  //navegar para uma page de inappviwer
                                  //https://www.imdb.com/title/ + movie.imdbId
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 16.0, left: 16, top: 8, bottom: 8),
                        child: Column(
                          children: [
                            Text(
                              movie.tagline,
                              style: TextStyle(color: textColor, fontSize: 16),
                            ),
                            Text(
                              movie.overview,
                              style: TextStyle(color: textColor, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RatingAndClicks(
                              size: size,
                              averageVotes: movie.voteAverage,
                              voteCount: movie.voteCount,
                              textColor: textColor),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> setGenres(List<String> genres, Color textColor) {
  List<Widget> widgetList = [];
  for (var genre in genres) {
    final textWidget =
        Text(genre, style: TextStyle(color: textColor, fontSize: 18));
    widgetList.add(textWidget);
  }
  return widgetList;
}

class RatingAndClicks extends StatelessWidget {
  const RatingAndClicks(
      {Key? key,
      required this.size,
      required this.averageVotes,
      required this.voteCount,
      required this.textColor})
      : super(key: key);
  final Color textColor;
  final Size size;
  final double averageVotes;
  final int voteCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 32, right: 8),
            child: Icon(
              Icons.star,
              size: 36,
              color: Colors.amber,
            ),
          ),
          Column(
            children: [
              Text(
                "$averageVotes / 10",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
              Text(
                '$voteCount votes',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
