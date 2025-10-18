import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/providers/food_data_controller.dart';
import 'package:food_ecommerce_app/ui/widgets/f_e_app_bar.dart';
import 'package:provider/provider.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      //======================== App Bar Section ==========================
      appBar: FEAppBar(title: 'My Favorites', spaceWidth: 26),

      //====================== Body Section ==========================
      body: SafeArea(
        child: Consumer<FoodDataController>(
          builder: (context, controller, child) {
            return Visibility(
              visible: controller.myFavoritesList.isNotEmpty,
              replacement: Center(child: Text("No Favorites added")),
              child: ListView.separated(
                itemCount: controller.myFavoritesList.length,
                itemBuilder: (context, index) {
                  final food = controller.myFavoritesList[index];
                  return ListTile(
                    leading: Container(
                      width: 65,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(0xffFEF0F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(food.images, width: 40, height: 24),
                    ),
                    title: Text(
                      food.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      "subtitle",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    //--------------- Trailing --------
                    trailing: GestureDetector(
                      onTap: () => controller.removeToFavorites(food.id),
                      child: Icon(Icons.favorite, color: theme.primaryColor),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Color(0xffF3F3F3), height: 1);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
