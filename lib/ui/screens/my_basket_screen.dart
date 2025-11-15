import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/widgets/checkout_bottom_modal_sheet.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/ui/widgets/f_e_app_bar.dart';
import 'package:provider/provider.dart';
import '../../controllers/food_data_controller.dart';

class MyBasketScreen extends StatelessWidget {
  const MyBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //======================== App Bar Section ==========================
      appBar: FEAppBar(title: 'My Basket', spaceWidth: 34),

      //====================== Body Section ==========================
      body: SafeArea(
        child: Consumer<FoodDataController>(
          builder: (context,controller,child) {
            return Visibility(
              visible: controller.myBasketList.isNotEmpty,
              replacement: Center(child: Text("No Basket added")),
              child: ListView.separated(
                itemCount: controller.myBasketList.length,
                itemBuilder: (context, index) {
                  final food = controller.myBasketList[index];

                  return Dismissible(
                    key: ValueKey(food.id),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction){
                      controller.removeToBasket(food.id);
                    },

                    child: ListTile(
                      leading: Container(
                        width: 65,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Color(0xffFEF0F0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(food.images, width: 40, height: 24),
                      ),
                      title: Text(
                        food.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        "subtitle",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      //--------------- Price ------------------
                      trailing: Text("\$ ${controller.foodPrice.toString()}",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Color(0xffF3F3F3), height: 1);
                },
              ),
            );
          }
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
                        //fontWeight: FontWeight.w500,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: AppColors.textPrimaryColor,

                        //fontFamily: bando
                      ),
                    ),
                    Consumer<FoodDataController>(
                      builder: (context,controller,_) {
                        return Text(
                          "\$${controller.totalBasketPrice}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color: AppColors.textPrimaryColor,

                            //fontFamily: bando
                          ),
                        );
                      }
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
