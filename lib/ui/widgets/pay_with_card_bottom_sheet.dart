import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/order_complete_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';

dynamic payWithCardBottomSheet(context) {
  final screenSize = MediaQuery.of(context).size;
  final double screenWidth = screenSize.width;
  // final double screenHeight = screenSize.height;
  final ThemeData theme = Theme.of(context);

  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    elevation: 4,

    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48,
            width: 48,
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.textPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),

          SizedBox(height: 10),

          //---------------------------------------- Column ---------------
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                //------------------- Delivery address title  ----------------
                Text(
                  "Delivery address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: AppColors.textPrimaryColor,

                    //fontFamily: bando
                  ),
                ),

                //----------space -----
                SizedBox(height: 18),
                //--------------------- Delivery address field -------------
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Bannani 2,Mohakhali,Dhaka",
                  ),
                ),
                SizedBox(height: 24),
                //------------------- Contact number ------------
                Text(
                  "Number we can call",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: AppColors.textPrimaryColor,

                    //fontFamily: bando
                  ),
                ),

                //----------space -----
                SizedBox(height: 18),
                //--------------------- Contract Number field -------------
                TextFormField(
                  decoration: InputDecoration(hintText: "01560029377"),
                ),
                SizedBox(height: 40),

                //--------------------- Date CCV Title --------------------------
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //----------------- Date title -----------
                    Text("Date"),
                    Spacer(),

                    //---------------- CCV Title -------------
                    Text("CCV"),

                    SizedBox(width: screenWidth * .30),
                  ],
                ),

                SizedBox(height: 16),

                //--------------------- Date CCV Field ---------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //------------------------- Date Field --------
                    SizedBox(
                      width: screenWidth * .40,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "10/30"),
                      ),
                    ),

                    //--------------------- CCV Field -----------------
                    SizedBox(
                      width: screenWidth * .40,
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "123"),
                      ),
                    ),
                  ],
                ),

                // Row(
                //   children: [
                //     //--------------------- Date ---------------------
                //     SizedBox(
                //       width: screenWidth * .40,
                //       child: Column(
                //         children: [
                //           Text("Date"),
                //           TextFormField(
                //             decoration: InputDecoration(hintText: "10/30"),
                //           ),
                //         ],
                //       ),
                //     ),

                //     //--------- free jayga ja space nibe-----
                //     Spacer(),

                //     //------------------ CCV -----------
                //     SizedBox(
                //       width: screenWidth * .40,
                //       child: Column(
                //         children: [
                //           Text("CCV"),
                //           TextFormField(
                //             decoration: InputDecoration(hintText: "123"),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
