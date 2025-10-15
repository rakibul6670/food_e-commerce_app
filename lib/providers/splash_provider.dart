// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:food_ecommerce_app/ui/screens/welcome_screen.dart';
// import 'package:provider/provider.dart';

// // ignore: use_key_in_widget_constructors
// class SplashProvider extends ChangeNotifierProvider {
//   SplashProvider({required super.create});

//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   void goNextScreen() {
//     Future.delayed(Duration(seconds: 2), () {
//       navigatorKey.currentState.pushAndRemoveUntil(
//         MaterialPageRoute(builder: (context) => WelcomeScreen()),
//         (predicate) => false,
//       );
//       //   NavigatorKey.currentState.pushAndRemoveUntil(_ ,
//       //     MaterialPageRoute(builder: (_) => WelcomeScreen()),
//       //     (predicate) => false,
//       //   );
//     });
//   }
// }
