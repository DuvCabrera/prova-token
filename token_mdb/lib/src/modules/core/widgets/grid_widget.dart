import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget gridBuilder(
    {required int itemCount,
    required List<dynamic> list,
    required Size size,
    required Widget Function({dynamic size, dynamic item}) functionBuilder}) {
  return GridView.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200),
      itemBuilder: (context, index) {
        return InkWell(
            child: functionBuilder(size: size, item: list[index]),
            onTap: () {
              Modular.to.pushNamed('/movie-detail', arguments: list[index].id);
            });
      });
}
