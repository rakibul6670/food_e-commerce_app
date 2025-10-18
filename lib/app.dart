import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_theme.dart';
import 'package:food_ecommerce_app/providers/food_data_controller.dart';
import 'package:food_ecommerce_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class FoodEcommerceApp extends StatelessWidget {
  const FoodEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FoodDataController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
