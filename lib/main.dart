import 'package:animaciones_personalizadas/src/screens/emegercy_screen.dart';
import 'package:animaciones_personalizadas/src/screens/sliver_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: SliverPage());
  }
}
