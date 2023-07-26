import 'package:animaciones_personalizadas/src/widgets/buttom_fat.dart';
import 'package:animaciones_personalizadas/src/widgets/headers.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5),
          Color(0xff906EF5)),
      ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
          Color(0xff536CF6)),
      ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((it) => FadeInLeft(
              child: BotonGordo(
                texto: it.texto,
                icon: it.icon,
                color1: it.color1,
                color2: it.color2,
                onPress: () {},
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              const SizedBox(
                height: 80,
              ),
              ...itemMap
            ]),
          ),
          Encabezado()
        ],
      ),
    );
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
            icon: FontAwesomeIcons.plus,
            titulo: 'Asistencia medica',
            subtitulo: 'Haz solicitado'),
        Positioned(
            top: 40,
            right: 0,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15.0),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class BotomGordoTemp extends StatelessWidget {
  const BotomGordoTemp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      color1: Colors.grey,
      color2: Colors.blueGrey,
      icon: FontAwesomeIcons.plus,
      onPress: () {
        print('ak');
      },
      texto: 'Motor accident',
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Medica',
    );
  }
}
