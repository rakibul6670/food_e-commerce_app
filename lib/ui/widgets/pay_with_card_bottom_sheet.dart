import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/controllers/pay_card_form_provider.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/screens/order_complete_screen.dart';
import 'package:food_ecommerce_app/validator/form_vlaidation.dart';
import 'package:provider/provider.dart';

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
      return ChangeNotifierProvider(
        create: (context) => PayCardFormProvider(),
        child: Builder(
          builder: (context) {
            final payCardFormProvider = context.read<PayCardFormProvider>();
            return SingleChildScrollView(
              child: Form(
                key: payCardFormProvider.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          //------------------- Card Holder Number  ----------------
                          Text(
                            "Card Holder Number",
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
                          //--------------------- Card holder field -------------
                          TextFormField(
                            controller: payCardFormProvider.cardHoldNController,
                            validator: FormValidation.validateCardHolder,
                            decoration: InputDecoration(
                              hintText: "Adolph chirs",
                            ),
                          ),
                          SizedBox(height: 24),
                          //-------------------Card Number ------------
                          Text(
                            "Card Number",
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
                          //--------------------- Card Number field -------------
                          TextFormField(
                            controller:
                                payCardFormProvider.cardNumberController,
                            validator: FormValidation.validateCardNumber,
                            decoration: InputDecoration(
                              hintText: "01560 0293 4577 6578",
                            ),
                          ),
                          SizedBox(height: 40),

                          //--------------------- Date and CCV Title --------------------------
                          Row(
                            children: [
                              //----------------- Date title ---
                              Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,

                                  color: AppColors.textPrimaryColor,

                                  //fontFamily: bando
                                ),
                              ),
                              Spacer(),

                              //---------------- CCV Title --------
                              Text(
                                "CCV",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,

                                  color: AppColors.textPrimaryColor,

                                  //fontFamily: bando
                                ),
                              ),

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
                                  controller:
                                      payCardFormProvider.cardDateController,
                                  validator: FormValidation.validateExpiryDate,
                                  decoration: InputDecoration(
                                    hintText: "10/30",
                                  ),
                                ),
                              ),

                              //--------------------- CCV Field -----------------
                              SizedBox(
                                width: screenWidth * .40,
                                child: TextFormField(
                                  controller:
                                      payCardFormProvider.cardVCCController,
                                  validator: FormValidation.validateCCV,
                                  decoration: InputDecoration(hintText: "123"),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24),
                          //------------------ Bottom Complete Button Section -----------
                          GestureDetector(
                            onTap: () {
                              if (payCardFormProvider.payCardValidate()) {
                                Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                    builder: (context) => OrderCompleteScreen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.symmetric(),
                              height: 96,
                              decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(24),
                                // borderRadius: BorderRadius.only(
                                //   topLeft: Radius.circular(24),
                                //   topRight: Radius.circular(24),
                                // ),
                              ),
                              child: Center(
                                child: Container(
                                  //padding: EdgeInsets.all(16),
                                  height: 56,
                                  width: 135,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Complete Order",
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 16,
                                        height: 24 / 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //------------space ------------
                          //SizedBox(height: 20),
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
