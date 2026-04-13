import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qoutes/config/routes/app_routes.dart';
import 'package:qoutes/core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  _goNext() => Navigator.pushReplacementNamed(context, Routes.quotes);
  _startDelay() {
    _timer = Timer(Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AssetsManager.splash)));
  }
}
