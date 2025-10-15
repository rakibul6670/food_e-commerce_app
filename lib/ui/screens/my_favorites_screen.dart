import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/ui/widgets/food_list_title.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //======================== App Bar Section ==========================
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("My Favorites"),
        centerTitle: true,
      ),

      //====================== Body Section ==========================
      body: SafeArea(
        child: FoodListTitle(
          itemCount: 10,
          //================= Food Title ==============
          title: "Title 1",

          //================ Food subTitle ================
          subTitle: "Subtitle 1",

          //=============== Favorites Icon Button ================
          trailing: Icon(Icons.favorite, color: theme.primaryColor),
        ),
      ),
    );
  }
}
