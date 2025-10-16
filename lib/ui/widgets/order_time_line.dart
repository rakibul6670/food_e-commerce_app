import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';

class OrderTimeLine extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool status;
  final Color bgColor;
  final Widget? subTitle;
  final double? height;
  final double? width;
  final Color? trailingBgColor;
  final Icon? trailingIcon;

  const OrderTimeLine({
    super.key,
    required this.iconPath,
    required this.title,
    required this.status,
    required this.bgColor,
    this.subTitle,
    this.height,
    this.width,
    this.trailingBgColor,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Row(
        children: [
          //---------------- icon ---------
          Container(
            padding: EdgeInsets.all(15),
            height: 64,
            width: 65,
            decoration: BoxDecoration(
              color: bgColor,
              image: DecorationImage(image: AssetImage(iconPath)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //------------------- Title ----------------
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              //--------------- subtitle ---------
              subTitle ?? SizedBox(height: 0),
            ],
          ),

          //--------------- free jayga all space nibe -------
          Spacer(),

          Container(
            height: height ?? 30, //24
            width: width ?? 30, //24
            decoration: BoxDecoration(
              color: status
                  ? AppColors.completeOrder
                  : trailingBgColor ?? Colors.red,
              shape: BoxShape.circle,
            ),
            child: status
                ? Icon(Icons.check, color: Colors.white, size: 20)
                //------------- status false hole tailing value dekhbe
                //---if tailing Icon null hoy tokhon close icon hobe
                : trailingIcon ??
                      Icon(Icons.close, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
