import 'package:flutter/material.dart';
import 'package:quick_mart_app/core/utils/assets.gen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Assets.images.quickmartlight.image(),
    ));
  }
}
