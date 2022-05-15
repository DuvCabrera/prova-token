import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {Key? key,
      required this.title,
      required this.haveBackButton,
      this.favorite = false})
      : super(key: key);
  final String title;
  final bool haveBackButton;
  final bool? favorite;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: haveBackButton
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => Modular.to.pop(),
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      child: const Text(
                        'Voltar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 24, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                favorite!
                    ? ElevatedButton(
                        onPressed: () => Modular.to.pushNamed('/favorite'),
                        style: ElevatedButton.styleFrom(primary: Colors.amber),
                        child: const Text(
                          'Favoritos',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : const SizedBox(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 24, color: Colors.amber),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Modular.to.pushNamed('/favorite'),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  child: const Text(
                    'Favoritos',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
    );
  }
}
