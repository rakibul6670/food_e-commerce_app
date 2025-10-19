import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/ui/screens/food_details_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/food_card.dart';
import 'package:provider/provider.dart';

import '../../controllers/food_data_controller.dart';

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
        builder: (context, controller, child) {
          return Visibility(
            visible: controller.recommendedFoodList.isNotEmpty,
            replacement: Center(
              child: CircularProgressIndicator(color: Colors.blue),
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: controller.recommendedFoodList.length,
              itemBuilder: (context, index) {
                final food = controller.recommendedFoodList[index];
                // Logger logger = Logger();
                // logger.i("Food Image : ${food.images}");

                return FoodCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailsScreen(model: food),
                      ),
                    );
                  },
                  images: food.images,
                  name: food.name,
                  // price: food.price,
                  id: food.id,
                  price: controller.foodPrice,
                  foodDataModel: food,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 23);
              },
            ),
          );
        },
      ),

    );
  }
}
