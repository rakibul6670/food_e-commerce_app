import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/ui/screens/food_details_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/on_tap_icon_button.dart';

class RecommendedFoodSection extends StatelessWidget {
  const RecommendedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
      height: 183, //183
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
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
                boxShadow: [BoxShadow()],
              ),
              child: Stack(
                children: [
                  //------------------- Favorites icon ----------
                  Positioned(top: 10, right: 16, child: Icon(Icons.favorite)),

                  //------------------ Image --------------
                  Positioned(
                    top: 22,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      AssetsImagesPath.honeyLime,
                      height: 80,
                      width: 80,
                      //  fit: BoxFit.cover,
                    ),
                  ),

                  //------------------- Title ----
                  Positioned(
                    top: 110,
                    left: 10,
                    child: Text(
                      "Honey lime combo",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
                        Text(
                          "\$230",
                          style: TextStyle(color: theme.primaryColor),
                        ),

                        //------------------- add to cart -----------
                        OnTapIconButton(
                          height: 24,
                          width: 24,
                          iconData: Icons.add,

                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 23);
        },
      ),
    );
  }
}
