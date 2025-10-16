import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/widgets/checkout_bottom_modal_sheet.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/ui/widgets/f_e_app_bar.dart';
import 'package:food_ecommerce_app/ui/widgets/food_list_title.dart';

class MyBasketScreen extends StatelessWidget {
  const MyBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //======================== App Bar Section ==========================
      appBar: FEAppBar(title: 'My Basket', spaceWidth: 34),

      //====================== Body Section ==========================
      body: SafeArea(
        child: FoodListTitle(
          itemCount: 10,
          //=============== Food Title ====================
          title: "Title 1",
          //=================== Food sub title ============
          subTitle: "Subtitle 1",
          //==================== Price ===================
          price: "345",
        ),
      ),

      //================= Bottom favorites and Add Basket Button ==============
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        height: 100,

        decoration: BoxDecoration(color: Colors.white),
        child:
            //  ListTile(
            //   title: Text("Total"),
            //   subtitle: Text("\$60,00"),
            //   trailing: ,
            // ),
            Row(
              children: [
                //------------------- add to favoites -----------------
                Column(
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: AppColors.textPrimaryColor,

                        //fontFamily: bando
                      ),
                    ),
                    Text(
                      "\$60000",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                        color: AppColors.textPrimaryColor,

                        //fontFamily: bando
                      ),
                    ),
                  ],
                ),

                // Icon(Icons.favorite_border, color: theme.primaryColor, size: 30),
                Spacer(),

                //--------------------- Add Basket button ------------
                CustomTextButton(
                  width: screenWidth * .40,
                  buttonName: "Checkout",
                  onpressed: () {
                    checkoutBottomModalSheet(context);
                  },
                ),
              ],
            ),
      ),
    );
  }
}
