import 'package:flutter/material.dart';

List<Widget> setGenres(List<String> genres, Color textColor) {
  List<Widget> widgetList = [];
  for (var genre in genres) {
    final textWidget =
        Text(genre, style: TextStyle(color: textColor, fontSize: 18));
    widgetList.add(textWidget);
  }
  return widgetList;
}
