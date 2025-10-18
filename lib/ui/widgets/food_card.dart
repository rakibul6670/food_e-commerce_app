import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/data/models/food_data_models.dart';
import 'package:food_ecommerce_app/providers/food_data_controller.dart';
import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

import '../../core/constants/assets_images_path.dart';

import 'on_tap_icon_button.dart';

class FoodCard extends StatelessWidget {
  final int id;
  final String images;
  final String name;
  final double price;
  final FoodDataModel foodDataModel;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.images,
    required this.name,
    required this.price,
    required this.id,
    required this.foodDataModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Logger logger = Logger();
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 183,
        width: 152,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          //boxShadow: [BoxShadow()],
        ),
        child: Stack(
          children: [
            //------------------- Favorites icon ----------
            Consumer<FoodDataController>(
              builder: (context, controller, child) {
                return Positioned(
                  top: 5,
                  right: 5,
                  child: OnTapIconButton(
                    iconData: controller.isAlreadyFavorited(id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.transparent,
                    onTap: () {
                      if (controller.isAlreadyFavorited(id)) {
                        controller.removeToFavorites(id);
                      } else {
                        controller.addToFavorites(foodDataModel);
                      }
                    },
                  ),
                );
              },
            ),

            // Positioned(top: 10, right: 16, child: Icon(Icons.favorite)),

            //------------------ Image --------------
            Positioned(
              top: 22,
              left: 0,
              right: 0,
              child: Image.network(
                images,
                height: 80,
                width: 80,
                errorBuilder: (context, _, StackTrace) {
                  return Image.asset(
                    AssetsImagesPath.honeyLime,
                    height: 80,
                    width: 80,
                  );
                },
                //  fit: BoxFit.cover,
              ),
            ),

            //------------------- Title ----
            Positioned(
              top: 110,
              left: 10,
              right: 10,
              child: Text(name, overflow: TextOverflow.ellipsis, maxLines: 1),
            ),

            //---------------- Price and Quantity ----------
            Positioned(
              bottom: 20,
              left: 10,
              right: 18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //--------------- price ---------------
                  Text("\$$price", style: TextStyle(color: theme.primaryColor)),

                  //------------------- add to cart -----------
                  OnTapIconButton(
                    height: 24,
                    width: 24,
                    iconData: Icons.add,

                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyBasketScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
