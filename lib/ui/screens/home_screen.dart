import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_icons_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      //---------------------------- Body Section ----------------------------
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              //------------------- Menu and Favorites and Shopping Cart ---------------
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //----------- Drawer menu Icon Button -----
                  Icon(Icons.menu),

                  Spacer(),

                  //----------- Favorited icon button ----
                  SizedBox(
                    height: 42,
                    width: 24,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AssetsIconsPath.favorites,
                          height: 24,
                          width: 24,
                        ),
                        Text(
                          "fav",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff27214D),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //----------- Cart icon button ----
                  SizedBox(
                    height: 41,
                    //width: 42,
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: theme.primaryColor,
                          size: 25,
                        ),
                        // Image.asset(
                        //   AssetsIconsPath.shoppingBasket,
                        //   height: 50, //24
                        //   width: 50, //24
                        //   fit: BoxFit.cover,
                        // ),
                        Text(
                          "My basket",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff27214D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              //---------------- Title -------------------
              SizedBox(height: 24),
              Text(
                "Hello Tony, What fruit salad \n combo do you want today?",
                style: TextStyle(color: Color(0xff27214D)),
              ),
              SizedBox(height: 24),

              //--------------- Search and Filter Section -------------
              Row(
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
                  Icon(Icons.filter_list_alt, color: Color(0xff203B7C)),
                ],
              ),

              //--------------- Section title -------------------
              SizedBox(height: 39),
              Text("Recommended Combo"),
            ],
          ),
        ),
      ),
    );
  }
}
