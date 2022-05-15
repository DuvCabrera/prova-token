import 'package:flutter_modular/flutter_modular.dart';

import '../../../database/database.dart';
import 'domain/domain.dart';
import 'external/external.dart';
import 'infra/infra.dart';
import 'presenter/presenter.dart';

class FavoriteMovieDetailModular extends Module {
  @override
  List<Module> get imports => [DataBaseModular()];

  @override
  List<Bind> get binds => [
        //External
        Bind<IFavoriteLocalDatasource>(
            (i) => FavoriteLocalDatabase(create: i(), delete: i(), read: i()),
            export: true),

        //Infra
        Bind<IGetFavoriteToMovieDetail>((i) => GetFavoriteToMovieDetail(i()),
            export: true),
        Bind<IDeleteFavoriteToMovieDetail>(
            (i) => DeleteFavoriteToMovieDetail(i()),
            export: true),
        Bind<ICreateFavoriteToMovieDetail>(
            (i) => CreateFavoriteToMovieDetail(i()),
            export: true),

        //Domain
        Bind<ICreateFavoriteFromMovieDetail>(
            (i) => CreateFavoriteFromMovieDetail(
                repository: i(), tableName: 'favorite'),
            export: true),
        Bind<IDeleteFavoriteFromMovieDetail>(
            (i) => DeleteFavoriteFromMoveDetail(
                repository: i(), tableName: 'favorite'),
            export: true),
        Bind<IGetFavotire>(
            (i) => GetFavoriteFromMovieDetail(
                repository: i(), tableName: 'favorite'),
            export: true),

        //Store
        Bind<FavoriteFromMovieDetailStore>(
            (i) => FavoriteFromMovieDetailStore(
                create: i(), read: i(), delete: i()),
            export: true),
      ];
}
