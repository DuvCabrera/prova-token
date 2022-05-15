import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:token_mdb/src/modules/movie_detail/movie_detail.dart';

import '../../../core/core.dart';

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
    IconData icon = (store.isFavorite) ? Icons.favorite : Icons.favorite_border;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Observer(
          builder: (context) {
            if (store.loadingState == LoadingState.loading) {
              store.getMovie(widget.movieId);
              return loadingScreen();
            }
            if (store.loadingState == LoadingState.error) {
              return errorScreen(store.error);
            }
            MovieDetail movie = store.movieDetailtoShow;
            store.favoriteCheck(movie.id);
            return Container(
              height: size.height,
              width: size.width,
              color: const Color.fromARGB(255, 14, 13, 13),
              child: Column(
                children: [
                  const AppBarWidget(
                      title: 'Movie Details', haveBackButton: true),
                  SizedBox(
                    height: size.height * 0.89,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.35,
                            width: size.width,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                SizedBox(
                                  width: size.width,
                                  child: Image.network(
                                    movie.posterUrl,
                                    fit: BoxFit.fill,
                                    errorBuilder: (context, _, __) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.error,
                                            color: Colors.amber,
                                            size: 36,
                                          ),
                                          Text(
                                            'Image not found',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.amber),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  height: size.height * 0.1,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Color.fromARGB(255, 14, 13, 13)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                      color: Colors.black.withOpacity(1)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.65,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            'COUNTRY OF PRODUCTION',
                                            style: TextStyle(
                                                color: textColor, fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Text(movie.productionCountries,
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                              'Released :${movie.releaseDate}',
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 20)),
                                        ),
                                        Text(
                                            'Duration: ${movie.runtime.toString()} MIN',
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize: 18)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                    child: Image.network(
                                      movie.posterUrl,
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, _, __) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.error,
                                              color: Colors.amber,
                                              size: 36,
                                            ),
                                            Text(
                                              'Image not found',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.amber),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'GENRES',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              226, 209, 204, 204),
                                        ),
                                      ),
                                      Row(
                                        children:
                                            setGenres(movie.genres, textColor),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    height: size.height * 0.1,
                                    child: GestureDetector(
                                      child: Image.asset('images/IMDB.png'),
                                      onTap: () {
                                        Modular.to.pushNamed('/site-imdb',
                                            arguments:
                                                '${UrlConstants.imdbSiteUrl}${movie.imdbId}');
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
                                    style: TextStyle(
                                        color: textColor, fontSize: 16),
                                  ),
                                  Text(
                                    movie.overview,
                                    style: TextStyle(
                                        color: textColor, fontSize: 16),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, bottom: 8),
                                child: Row(
                                  children: [
                                    Observer(
                                      builder: (context) {
                                        if (store.isFavorite) {
                                          icon = Icons.favorite;
                                        } else {
                                          icon = Icons.favorite_border;
                                        }

                                        return GestureDetector(
                                          child: Icon(
                                            icon,
                                            color: Colors.amber,
                                            size: 40,
                                          ),
                                          onTap: () => store.onLikeIt(),
                                        );
                                      },
                                    ),
                                    const Text(
                                      'Like it',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.amber),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
