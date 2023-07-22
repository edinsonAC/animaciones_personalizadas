import 'package:animaciones_personalizadas/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesScreen extends StatefulWidget {
  const GraficasCircularesScreen({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesScreen> createState() =>
      _GraficasCircularesScreenState();
}

class _GraficasCircularesScreenState extends State<GraficasCircularesScreen> {
  late double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Colors.yellow,
            ),
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Colors.pink,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Colors.blue,
            ),
            CustomRadialProgress(
              porcentaje: porcentaje,
              color: Colors.green,
            )
          ],
        )
      ]),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: RadialProgress(
        porcentaje: porcentaje,
        color: color,
        grosorSecundario: 5.0,
      ),
    );
  }
}
