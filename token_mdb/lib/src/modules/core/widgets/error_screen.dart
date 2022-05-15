import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget errorScreen(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'An error was found: $error. Please try again.',
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ElevatedButton(
          onPressed: () {
            Modular.to.popAndPushNamed('/');
          },
          child: const Text(
            'Try again.',
          ),
        ),
      ],
    ),
  );
}
