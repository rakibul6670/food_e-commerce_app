import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/home_screen.dart';
import 'package:food_ecommerce_app/ui/screens/track_order_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,

      //====================== Body section ===================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                //---------------------- Congratulation Check Image --------------
                Container(
                  alignment: Alignment.center,
                  height: 164,
                  width: 156,
                  decoration: BoxDecoration(
                    color: AppColors.completeOrderSC,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: AppColors.completeOrder,
                    ),
                  ),
                  child: Container(
                    //  padding: EdgeInsets.all(29),
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.completeOrder,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: Colors.white, size: 50),
                  ),
                ),

                //---------- Space ---
                SizedBox(height: 56),
                //------------------- Contratulation  ----------------
                Text(
                  "Congratulation",
                  style: TextStyle(
                    fontSize: 32,
                    //-------- this is line height -
                    //----------- line height always lineHeight / fontSize ;
                    height: 32 / 32,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: AppColors.textPrimaryColor,

                    //fontFamily: bando
                  ),
                ),

                //---------- Space ---
                SizedBox(height: 16),
                //------------------- Contratulation  ----------------
                Text(
                  "Your order have been taken and \n is being attended to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: AppColors.textPrimaryColor,
                    //-------- this is line height -
                    //----------- line height always lineHeight / fontSize ;
                    height: 30 / 20,

                    //fontFamily: bando
                  ),
                ),

                //------------- space -
                SizedBox(height: 56),

                //------------------------ Track order -----------------
                CustomTextButton(
                  width: screenWidth * .40,
                  buttonName: "Track order",
                  onpressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackOrderSreen()),
                  ),
                ),

                //------------- space -
                SizedBox(height: 48),
                //------------------------- Continue Shopping Button --------------
                CustomTextButton(
                  width: screenWidth * .50,
                  buttonName: "Continue Shopping",
                  backgroundColor: Colors.transparent,
                  borderSide: BorderSide(color: theme.primaryColor),
                  foregroundColor: theme.primaryColor,
                  onpressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (predicate) => false,
                  ),
                ),

                //--------------space ---------
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
