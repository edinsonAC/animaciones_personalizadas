import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool topPosition;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {Key? key,
      required this.slides,
      this.topPosition = false,
      required this.colorPrimario,
      required this.colorSecundario,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
            Provider.of<_SlideshowModel>(context).colorSecundario =
                colorSecundario;
            Provider.of<_SlideshowModel>(context).bulletPrimario =
                bulletPrimario;
            Provider.of<_SlideshowModel>(context).bulletSecundario =
                bulletSecundario;
            return _crearEstructuraSlideshow(
                topPosition: topPosition, slides: slides);
          },
        )),
      ),
    );
  }
}

class _crearEstructuraSlideshow extends StatelessWidget {
  const _crearEstructuraSlideshow({
    super.key,
    required this.topPosition,
    required this.slides,
  });

  final bool topPosition;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (topPosition)
          _Dots(
            itemCount: slides.length,
          ),
        Expanded(child: Slides(slides: slides)),
        if (!topPosition)
          _Dots(
            itemCount: slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int itemCount;
  const _Dots({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              itemCount,
              (index) => _Dot(
                    index: index,
                  ))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final slideModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;

    if (slideModel.currentPage >= index - 0.5 &&
        slideModel.currentPage < index + 0.5) {
      tamano = slideModel.bulletPrimario;
      color = slideModel.colorPrimario;
    } else {
      tamano = slideModel.bulletSecundario;
      color = slideModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class Slides extends StatefulWidget {
  final List<Widget> slides;
  const Slides({Key? key, required this.slides}) : super(key: key);

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  final pagerViewController = PageController();

  @override
  void initState() {
    pagerViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pagerViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pagerViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pagerViewController,
      children: widget.slides
          .map((slide) => _Slide(
                slide: slide,
              ))
          .toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({
    super.key,
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;

  set currentPage(double valorActual) {
    _currentPage = valorActual;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;

  set colorPrimario(Color color) {
    _colorPrimario = color;
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double tam) {
    _bulletPrimario = tam;
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double tam) {
    _bulletSecundario = tam;
  }
}
