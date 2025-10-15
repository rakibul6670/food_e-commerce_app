import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_theme.dart';
import 'package:food_ecommerce_app/ui/screens/splash_screen.dart';

class FoodEcommerceApp extends StatelessWidget {
  const FoodEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
