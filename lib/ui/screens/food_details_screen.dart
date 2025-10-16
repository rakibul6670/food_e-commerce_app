import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';
import 'package:food_ecommerce_app/ui/screens/my_favorites_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/ui/widgets/on_tap_icon_button.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

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
                    Positioned(
                      top: 62,
                      left: 0,
                      right: 0,

                      child: Image.asset(
                        AssetsImagesPath.breakfastQuinoa,
                        height: 176,
                        width: 176,
                        fit: BoxFit.contain,
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
                    //-------------------- Title -------------
                    SizedBox(height: 40),
                    Text(
                      "Quinoa Fruit Salad",
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
                    Row(
                      children: [
                        //-------------- Quantity Increment ------
                        OnTapIconButton(
                          color: Colors.transparent,
                          border: Border.all(color: Color(0xff808080)),
                          iconData: Icons.remove,
                          onTap: () {},
                        ),

                        SizedBox(width: 24),
                        //------------------- Quantity ----------
                        Text(
                          "1",
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
                          onTap: () {},
                        ),

                        Spacer(),

                        //------------------------ Price -------------
                        Text(
                          "\$ 345",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff27214D),
                            fontSize: 24,
                            letterSpacing: 1,
                            // font brandon
                          ),
                        ),
                      ],
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
                    Text(
                      "Red Quinoa, Lime, Honey, Blueberries, Strawberries, \n Mango, Fresh mint.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff27214D),
                        fontSize: 16,
                        // font brandon
                      ),
                    ),

                    //-----------space -----
                    SizedBox(height: 20),
                    Divider(color: Color(0xffF3F3F3), height: 1),
                    SizedBox(height: 20),

                    //-------------------- description ---------------
                    Text(
                      "If you are looking for a new fruit salad to eat today, \n quinoa is the perfect brunch for you. make",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    //-------------space ----------
                    SizedBox(height: 43),
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
            OnTapIconButton(
              height: 48,
              width: 48,
              iconData: Icons.favorite_border,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavoritesScreen()),
              ),
            ),

            // Icon(Icons.favorite_border, color: theme.primaryColor, size: 30),
            Spacer(),

            //--------------------- Add Basket button ------------
            CustomTextButton(
              width: screenWidth * .60,
              buttonName: "Add to Basket",
              onpressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBasketScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
