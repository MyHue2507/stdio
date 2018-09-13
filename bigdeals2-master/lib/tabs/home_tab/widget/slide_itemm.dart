import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:bigdeals2/tabs/tabs.dart';

class SliderImage extends StatefulWidget {
  FetchSlide slide ;
  SliderImage({Key key, this.slide}) : super(key: key);
  _SliderImageState createState() => new _SliderImageState();
}

class _SliderImageState extends State<SliderImage>
    with SingleTickerProviderStateMixin {
  List<Slide> _slide = List();
  Animation<double> animation;
  AnimationController controller;
  _loadSlide() async {
    var nextSlide = await widget.slide.fetchUiSlide();
    setState(() {
      _slide.addAll(nextSlide);
    });
  }

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
      });
    controller.forward();
    _loadSlide();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = new Carousel(
      boxFit: BoxFit.cover,
      images: _slide.map((url) => NetworkImage(url.source)).toList(),
    );
    return new Container(
      height: 150.0,
      child: carousel,
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
