import 'package:animaciones_personalizadas/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Column(
          children: const [Expanded(child: Slides()), _Dots()],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(
            index: 0,
          ),
          _Dot(
            index: 1,
          ),
          _Dot(
            index: 2,
          ),
        ],
      ),
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
    final pageIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          color: pageIndex >= index - 0.5 && pageIndex < index + 0.5
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class Slides extends StatefulWidget {
  const Slides({Key? key}) : super(key: key);

  @override
  State<Slides> createState() => _SlidesState();
}

class _SlidesState extends State<Slides> {
  final pagerViewController = PageController();

  @override
  void initState() {
    pagerViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
    return PageView(controller: pagerViewController, children: const [
      _Slide(
        svg: 'assets/svgs/1.svg',
      ),
      _Slide(
        svg: 'assets/svgs/2.svg',
      ),
      _Slide(
        svg: 'assets/svgs/3.svg',
      ),
    ]);
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide({
    super.key,
    required this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: SvgPicture.asset(svg));
  }
}
