import 'package:clean_bookly/core/utils/app_router.dart';
import 'package:clean_bookly/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late AnimationController slidingController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _opacity = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 33.3,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 33.3,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 33.4,
      ),
    ]).animate(_controller);

    navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    slidingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _opacity,
        builder: (context, child) {
          return Opacity(opacity: _opacity.value, child: child);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Image.asset(AssetsData.logo), const SizedBox(height: 4)],
        ),
      ),
    );
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1800));
    if (!mounted) return;

    (context).push(AppRouter.kHomeView);
  }
}
