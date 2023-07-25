import 'package:animaciones_personalizadas/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          children: [
            Expanded(child: MiSlideshow()),
            Expanded(child: MiSlideshow()),
          ],
        ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      colorPrimario: Colors.white,
      colorSecundario: Colors.blue,
      topPosition: false,
      slides: [
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/6.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
      ],
    );
  }
}
