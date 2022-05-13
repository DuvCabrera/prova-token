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
            if (store.movieDetail.id != widget.movieId) {
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
            } else {
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
                        ),
                        decoration: const BoxDecoration(),
                      ),
                      SizedBox(
                        height: size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(movie.title,
                                        style: TextStyle(color: textColor)),
                                    Text(
                                      'PRODUCTED BY',
                                      style: TextStyle(color: textColor),
                                    ),
                                    Text(movie.productionCompanies['name'],
                                        style: TextStyle(color: textColor)),
                                    Row(
                                      children: [
                                        Text(movie.releaseDate,
                                            style: TextStyle(color: textColor)),
                                        Text(movie.runtime.toString(),
                                            style: TextStyle(color: textColor)),
                                        InkWell(
                                          child: Text('TRAILER',
                                              style:
                                                  TextStyle(color: textColor)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Image.network(movie.posterUrl)
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
                                    children:
                                        setGenres(movie.genres, textColor),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   width: 24,
                              // ),
                              RatingAndClicks(
                                averageVotes: movie.voteAverage,
                                size: size,
                                voteCount: movie.voteCount,
                                textColor: textColor,
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
                        child: Column(
                          children: [
                            Text(
                              movie.tagline,
                              style: TextStyle(color: textColor),
                            ),
                            Text(
                              movie.overview,
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

List<Widget> setGenres(List<String> genres, Color textColor) {
  List<Widget> widgetList = [];
  for (var genre in genres) {
    final textWidget = Text(genre, style: TextStyle(color: textColor));
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
