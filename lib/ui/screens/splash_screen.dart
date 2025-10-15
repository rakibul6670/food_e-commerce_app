import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/ui/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //==================== Background Colors ===================
      backgroundColor: theme.scaffoldBackgroundColor,

      //==================== Body Section ===============
      body: SafeArea(
        child: Center(
          child: Container(
            height: 204,
            width: 184,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsImagesPath.logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
