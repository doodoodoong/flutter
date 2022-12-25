import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const FlutterLogo(),
      ),
    );
  }
}

class Growtransition extends StatelessWidget {
  const Growtransition(
      {required this.child, required this.animation, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Growtransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
