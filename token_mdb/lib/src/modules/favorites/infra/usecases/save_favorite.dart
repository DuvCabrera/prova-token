// import '../../domain/domain.dart';
// import '../infra.dart';

// class SaveFavorite extends ISaveFavorite {
//   final String tableName;
//   final ILocalRepository repository;

//   SaveFavorite({required this.tableName, required this.repository});
//   @override
//   Future<void> createFavorite(
//       {required Favorite entity, required String tableName}) async {
//     final Map<String, dynamic> data = FavoriteModel(
//             id: entity.id,
//             title: entity.title,
//             posterUrl: entity.posterUrl,
//             genres: entity.genres)
//         .toMap();
//     await repository.createFavoriteInLocalRepository(
//         data: data, tableName: tableName);
//   }
// }
