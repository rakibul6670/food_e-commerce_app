import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_icons_path.dart';

class SearchFilterSection extends StatelessWidget {
  const SearchFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        //------------ Search box ---------------
        SizedBox(
          width: screenWidth * .78,
          height: 56,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search for fruit salad combos",
              hintStyle: TextStyle(
                color: Color(0xff86869E),
                letterSpacing: 0,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff86869E),
                size: 25,
              ),
            ),
          ),
        ),

        SizedBox(width: 10),

        //--------------- Filter icon button -----
        Image.asset(AssetsIconsPath.filter, width: 26, height: 17),
        // Icon(Icons.filter_list_alt, color: Color(0xff203B7C)),
      ],
    );
  }
}
