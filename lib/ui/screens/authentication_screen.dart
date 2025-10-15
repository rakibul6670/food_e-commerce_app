import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';
import 'package:food_ecommerce_app/ui/screens/home_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

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
                      AssetsImagesPath.authFoodBasket,
                      height: 260,
                      width: 310,
                      //fit: BoxFit.cover,
                    ),
                  ),

                  //================== basket =======
                  Positioned(
                    top: 423,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      AssetsImagesPath.authEllipes,
                      height: 12,
                      width: 301,
                      //fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            //================ Bottom Section =========================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),

                //---------------- Title --------------
                Text(
                  "What is your firstname?",
                  style: TextStyle(fontFamily: "Bad Script"),
                ),

                SizedBox(height: 16),

                //---------------- Name Field  --------------
                SizedBox(
                  height: 56,
                  width: screenWidth * .80,
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Jone"),
                  ),
                ),

                SizedBox(height: 42),
                //--------------------------- Lets Gets Button ----------
                SizedBox(
                  height: 56,
                  width: screenWidth * .80,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (predicate) => false,
                      );

                      // Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(
                      //   builder: (context)=> AuthenticationScreen(),
                      //   ( predicate)=> false);
                    },
                    child: Text("Start Ordering"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
