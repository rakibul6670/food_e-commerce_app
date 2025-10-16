import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_icons_path.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/ui/widgets/f_e_app_bar.dart';
import 'package:food_ecommerce_app/ui/widgets/order_time_line.dart';
import 'package:food_ecommerce_app/ui/widgets/vertical_dot.dart';

class TrackOrderSreen extends StatelessWidget {
  const TrackOrderSreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      //-------------------------AppBar ------------------
      appBar: FEAppBar(title: 'Delivery Status'),

      //---------------------- Body --------------------------------------------
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),

              //---------------------- Order Taken -----------
              OrderTimeLine(
                iconPath: AssetsIconsPath.order,
                title: "Order Taken",
                status: true,
                bgColor: AppColors.orderTakeIconBg,
              ),

              //-------------------- Dot ------------------
              VerticalDot(),

              //---------------------- Order Prepared -----------
              OrderTimeLine(
                iconPath: AssetsIconsPath.orderPrepared,
                title: "Order in being prepared",
                status: true,
                bgColor: AppColors.orderPreparedBg,
              ),

              //--------------------- dot ------------
              VerticalDot(),

              //-------------------- Delivery --------------------
              OrderTimeLine(
                iconPath: AssetsIconsPath.deliveryMan,
                title: "Order in being Delivery",
                subTitle: Text(
                  "Your delivery agent is coming",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                status: false,
                trailingBgColor: Colors.amber,
                height: 40,
                width: 40,
                trailingIcon: Icon(
                  Icons.phone_in_talk_rounded,
                  color: Colors.white,
                ),

                bgColor: AppColors.orderDeliveryBg,
              ),

              //--------------- Dot -------------------
              VerticalDot(),

              //---------------------- Order Taken -----------
              OrderTimeLine(
                iconPath: AssetsIconsPath.order,
                title: "Order Received",
                status: false,

                bgColor: AppColors.orderReceivedBg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
