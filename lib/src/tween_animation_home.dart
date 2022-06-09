import 'package:flutter/material.dart';

class TweenHome extends StatefulWidget {
  const TweenHome({Key? key}) : super(key: key);

  @override
  State<TweenHome> createState() => _TweenHomeState();
}

class _TweenHomeState extends State<TweenHome>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller!);
    sizeAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(controller!);
    controller!.addListener(() {
      setState(() {});
    });
    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Animation'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        height: sizeAnimation!.value,
        width: sizeAnimation!.value,
        color: colorAnimation!.value,
      )),
    );
  }
}
