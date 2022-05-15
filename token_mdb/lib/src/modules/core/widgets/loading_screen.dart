import 'package:flutter/material.dart';

Widget loadingScreen() {
  return Container(
    color: Colors.amber,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0, right: 36),
            child: Text(
              'Try to connect to intert',
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
                'Loading Data ',
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
