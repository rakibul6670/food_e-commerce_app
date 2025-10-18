import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';

import '../../core/constants/assets_images_path.dart';
import '../screens/food_details_screen.dart';
import 'on_tap_icon_button.dart';

class FoodCard extends StatelessWidget {
  final String images;
  final String title;
  final int price;

  const FoodCard({
    super.key,
    required this.images,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodDetailsScreen()),
      ),
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
            Positioned(
              top: 10,
              right: 16,
              child: OnTapIconButton(
                iconData: Icons.favorite_border,
                color: Colors.transparent,
                onTap: () {},
              ),
            ),

            // Positioned(top: 10, right: 16, child: Icon(Icons.favorite)),

            //------------------ Image --------------
            Positioned(
              top: 22,
              left: 0,
              right: 0,
              child: Image.asset(
                images,
                height: 80,
                width: 80,
                errorBuilder: (context, _, StackTrace) {
                  return Image.network(
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
              child: Text(title, overflow: TextOverflow.ellipsis, maxLines: 1),
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
