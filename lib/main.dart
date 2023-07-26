import 'package:animaciones_personalizadas/src/screens/pinterest_page.dart';
import 'package:animaciones_personalizadas/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: PinterestPage(),
      ),
    );
  }
}
