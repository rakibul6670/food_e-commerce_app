import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_images_path.dart';

class FoodListTitle extends StatelessWidget {
  final int itemCount;
  //final String imageUrl;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final String? price;

  const FoodListTitle({
    super.key,
    required this.itemCount,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 12,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 65,
            height: 64,
            decoration: BoxDecoration(
              color: Color(0xffFEF0F0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AssetsImagesPath.bestEverTropical,
              width: 40,
              height: 24,
            ),
          ),
          title: Text(title, overflow: TextOverflow.ellipsis, maxLines: 1),
          subtitle: Text(
            subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          //--------------- Trailing --------
          trailing: trailing ?? Text("\$ $price"),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(color: Color(0xffF3F3F3), height: 1);
      },
    );
  }
}
