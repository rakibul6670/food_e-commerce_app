import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/providers/food_data_controller.dart';
import 'package:food_ecommerce_app/ui/screens/food_details_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/food_card.dart';
import 'package:food_ecommerce_app/ui/widgets/icon_label_button.dart';
import 'package:food_ecommerce_app/ui/widgets/on_tap_icon_button.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class RecommendedFoodSection extends StatelessWidget {

  const RecommendedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
      height: 183, //183
      child: Consumer<FoodDataController>(
        builder: (context,controller,child) {
          return Visibility(
            visible: controller.recommendedFoodList.isNotEmpty,
            replacement: Center(child: CircularProgressIndicator(color: Colors.blue,)),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:controller.recommendedFoodList.length,
              itemBuilder: (context, index) {
                final food = controller.recommendedFoodList[index];
                Logger logger = Logger();
                logger.i("Food Image : ${food.images[0]}");

                return FoodCard(images:food.images[0] , title: food.title, price: food.price);
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 23);
              },
            ),
          );
        }
      ),
    );
  }
}
