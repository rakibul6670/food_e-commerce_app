import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/controllers/form_validation_controller.dart';
import 'package:food_ecommerce_app/controllers/user_form_provider.dart';
import 'package:food_ecommerce_app/core/theme/app_theme.dart';
import 'package:food_ecommerce_app/ui/screens/authentication_screen.dart';
import 'package:food_ecommerce_app/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controllers/food_data_controller.dart';

class FoodEcommerceApp extends StatelessWidget {
  const FoodEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodDataController()),
        ChangeNotifierProvider(create: (_) => FormValidationController()),
        // //------------ this controller only user authentication screen ------------
        // ChangeNotifierProvider(create: (_)=> UserFormProvider(),child: AuthenticationScreen(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
