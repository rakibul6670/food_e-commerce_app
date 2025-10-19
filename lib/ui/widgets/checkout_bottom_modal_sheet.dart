import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/controllers/order_form_provider.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/order_complete_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/custom_text_button.dart';
import 'package:food_ecommerce_app/ui/widgets/pay_with_card_bottom_sheet.dart';
import 'package:food_ecommerce_app/validator/form_vlaidation.dart';
import 'package:provider/provider.dart';

checkoutBottomModalSheet(context) {
  final screenSize = MediaQuery.of(context).size;
  final double screenWidth = screenSize.width;
  // final double screenHeight = screenSize.height;
  final ThemeData theme = Theme.of(context);

  //final OrderFormProvider orderFormProvider = OrderFormProvider();

  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    elevation: 4,

    context: context,
    builder: (context) {
      return ChangeNotifierProvider(
        create: (context) => OrderFormProvider(),
        child: Builder(
          builder: (context) {
            final orderFormProvider = context.read<OrderFormProvider>();
            return SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: orderFormProvider.formKey,
                child: Column(
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 40,
                      ),
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
                            controller: orderFormProvider.orderAController,
                            validator: FormValidation.deliveryAddressValidator,
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
                            controller: orderFormProvider.orderPNController,
                            validator: FormValidation.phoneNumberValidator,
                            decoration: InputDecoration(
                              hintText: "01560029377",
                            ),
                          ),
                          SizedBox(height: 40),

                          //--------------------- Payment Card ------------
                          Row(
                            children: [
                              //--------------------- Pay With delivery ----------
                              CustomTextButton(
                                width: screenWidth * .40,
                                backgroundColor: Colors.transparent,
                                foregroundColor: theme.primaryColor,
                                borderSide: BorderSide(
                                  color: theme.primaryColor,
                                ),
                                buttonName: "Pay on Delivery",
                                onpressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderCompleteScreen(),
                                  ),
                                ),
                              ),

                              //--------- free jayga ja space nibe-----
                              Spacer(),

                              //------------------ Pay width card -----------
                              CustomTextButton(
                                backgroundColor: Colors.transparent,
                                foregroundColor: theme.primaryColor,
                                borderSide: BorderSide(
                                  color: theme.primaryColor,
                                ),
                                width: screenWidth * .40,
                                buttonName: "Pay with card",
                                onpressed: () {
                                  if (orderFormProvider.userOrderValidate()) {
                                    //-------------- first close bottom sheet ------
                                    Navigator.pop(context);
                                    //----------- then show this bottom sheet -------
                                    payWithCardBottomSheet(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
