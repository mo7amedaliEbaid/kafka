import 'package:flutter/material.dart';
import 'package:kafka/configs/configs.dart';

import '../../animations/entrance_fader.dart';
import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_typography.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/dashboard');
    });
  }


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Center(
        child: EntranceFader(
          duration: const Duration(milliseconds: 300),
          offset: const Offset(0, 20),
          child: Text(
            'Kafka',
            style: AppText.h1b!.copyWith(
              fontSize: AppDimensions.normalize(20),
            ),
          ),
        ),
      ),
    );
  }
}
