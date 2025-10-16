import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/authentication_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
      //================ Body Section ==================
      body: SafeArea(
        child: Column(
          children: [
            //==================== Welcome Image Top Section ===========
            Container(
              height: screenHeight * .60,
              width: screenWidth,
              decoration: BoxDecoration(color: theme.primaryColor),
              child: Stack(
                children: [
                  //================== basket ================
                  Positioned(
                    top: 131,
                    //left: 0,
                    right: 43,
                    child: Image.asset(
                      AssetsImagesPath.fuirtsDrops2,
                      height: 50,
                      width: 37,
                      //fit: BoxFit.cover,
                    ),
                  ),

                  //================== food basket ================
                  Positioned(
                    top: 155,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      AssetsImagesPath.welcomeFoodBasket,
                      height: 260,
                      width: 310,
                      //fit: BoxFit.cover,
                    ),
                  ),

                  //================== basket table  =======
                  Positioned(
                    top: 423,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      AssetsImagesPath.welcomeEllips,
                      height: 12,
                      width: 301,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            //================ Bottom Section ========================================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),

                //---------------- Title --------------
                Text(
                  "Get The Freshest Fruit Salad Combo",
                  style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8),

                //---------------- subTitle --------------
                Text(
                  "We deliver the best and freshest fruit salad in \n town. Order for a combo today!!!",

                  style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 58),
                //--------------------------- Lets Gets Button ----------
                CustomTextButton(
                  width: screenWidth * .80,
                  buttonName: "Let's Continue",
                  onpressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthenticationScreen(),
                      ),
                      (predicate) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
