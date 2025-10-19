import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/data/models/food_data_models.dart';

import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';
import 'package:food_ecommerce_app/ui/screens/my_favorites_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/ui/widgets/on_tap_icon_button.dart';
import 'package:provider/provider.dart';

import '../../controllers/food_data_controller.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodDataModel model;

  const FoodDetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);

    return Scaffold(
      //backgroundColor: theme.primaryColor,
      //=========================== Body ===========
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //==================== image ===========
              Container(
                height: screenHeight * .40,
                decoration: BoxDecoration(color: theme.primaryColor),
                child: Stack(
                  children: [
                    //----------------- Back button
                    Positioned(
                      top: 24,
                      left: 24,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          height: 32,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back_ios, size: 15),
                              Text(
                                "back",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 62,
                      left: 0,
                      right: 0,

                      child: Image.network(
                        model.images,
                        height: 176,
                        width: 176,
                        fit: BoxFit.contain,
                        errorBuilder: (context, _, _) {
                          return Image.asset(
                            AssetsImagesPath.breakfastQuinoa,
                            height: 176,
                            width: 176,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //=================================== Food Details ==========================
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                //height: screenHeight * .60,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //-------------------- Food Name  -------------
                    SizedBox(height: 40),
                    Text(
                      model.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        fontSize: 32,
                        color: Color(0xff27214D),
                        //font:,
                      ),
                    ),

                    SizedBox(height: 33),
                    //------------------- Quantity + or - and Price ------------
                    Consumer<FoodDataController>(
                      builder: (context, controller, child) {
                        return Row(
                          children: [
                            //-------------- Quantity Increment ------
                            OnTapIconButton(
                              color: Colors.transparent,
                              border: Border.all(color: Color(0xff808080)),
                              iconData: Icons.remove,
                              onTap: () => controller.decrementQuantity(),
                            ),

                            SizedBox(width: 24),
                            //------------------- Quantity ----------
                            Text(
                              "${controller.quantity}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff27214D),
                                letterSpacing: 1,
                                fontSize: 24,
                                // font brandon
                              ),
                            ),
                            SizedBox(width: 24),
                            //-------------------- Quantity Drecrement ---------
                            OnTapIconButton(
                              //border: Border.all(color: Color(0xff808080)),
                              iconData: Icons.add,
                              onTap: () => controller.incrementQuantity(),
                            ),

                            Spacer(),

                            //------------------------ Price -------------
                            Text(
                              "\$ ${controller.totalPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff27214D),
                                fontSize: 24,
                                letterSpacing: 1,
                                // font brandon
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    //---------space -------
                    SizedBox(height: 32),
                    Divider(color: Color(0xffF3F3F3), height: 1),
                    SizedBox(height: 32),

                    Text(
                      "One Pack Contains: ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff27214D),
                        fontSize: 20,
                        // font brandon
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      width: 153,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: theme.primaryColor),
                      ),
                    ),

                    SizedBox(height: 18),
                    //----------------- Element of create food ----------
                    Column(
                      children: List.generate(model.ingredients.length, (
                        index,
                      ) {
                        return Text(
                          model.ingredients[index],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff27214D),
                            fontSize: 16,
                            // font brandon
                          ),
                        );
                      }),
                    ),

                    //-----------space -----
                    // SizedBox(height: 20),
                    // Divider(color: Color(0xffF3F3F3), height: 1),
                    // SizedBox(height: 20),

                    //-------------------- description ---------------

                    // Text(
                    //   "If you are looking for a new fruit salad to eat today, \n quinoa is the perfect brunch for you. make",
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     color: Color(0xff000000),
                    //     fontSize: 14,
                    //   ),
                    //   overflow: TextOverflow.ellipsis,
                    // ),

                    //-------------space ----------
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //================= Bottom favorites and Add Basket Button ==============
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        height: 100,

        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            //------------------- add to favoites -----------------
            Consumer<FoodDataController>(
              builder: (context, controller, child) {
                return OnTapIconButton(
                  height: 48,
                  width: 48,
                  iconData: controller.isAlreadyFavorited(model.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  onTap: () {
                    if (controller.isAlreadyFavorited(model.id)) {
                      controller.removeToFavorites(model.id);
                    } else {
                      controller.addToFavorites(model);
                    }
                  }
                  //     Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MyFavoritesScreen(),
                  //   ),
                  // ),
                );
              },
            ),

            // Icon(Icons.favorite_border, color: theme.primaryColor, size: 30),
            Spacer(),

            //--------------------- Add Basket button ------------
            Consumer<FoodDataController>(
              builder: (context,controller,child) {
                return CustomTextButton(
                  width: screenWidth * .60,
                  buttonName: controller.isAlreadyBasket(model.id) ?"Remove to Basket": "Add to Basket",
                  onpressed: () {
                    if (controller.isAlreadyBasket(model.id)) {
                      controller.removeToBasket(model.id);
                    } else {
                      controller.addToBasket(model);
                    }
                  }
                  // => Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyBasketScreen()),
                  // ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
