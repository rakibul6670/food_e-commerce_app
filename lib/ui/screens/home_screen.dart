import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_icons_path.dart';
import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';
import 'package:food_ecommerce_app/ui/screens/my_favorites_screen.dart';
import 'package:food_ecommerce_app/ui/widgets/categories_food_section.dart';
import 'package:food_ecommerce_app/ui/widgets/icon_label_button.dart';
import 'package:food_ecommerce_app/ui/widgets/recommended_food_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //================== Tab Controller =================
  late TabController tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    //  final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),

      //---------------------------- Body Section ----------------------------
      body: SafeArea(
        child: SingleChildScrollView(
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

                    //----------- Favorited icon button ------
                    IconLabelButton(
                      height: 42,
                      width: 24,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyFavoritesScreen(),
                        ),
                      ),
                      icon: Image.asset(
                        AssetsIconsPath.favorites,
                        height: 24,
                        width: 24,
                      ),
                      label: "fav",
                    ),

                    //----------- Cart icon button ----------
                    IconLabelButton(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBasketScreen(),
                        ),
                      ),
                      icon: Icon(
                        Icons.shopping_cart,
                        color: theme.primaryColor,
                        size: 25,
                      ),
                      label: "My basket",
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

                //========================== Recommended Food Section =============
                //--------------- Section title -------------------
                SizedBox(height: 39),
                Text("Recommended Combo"),
                SizedBox(height: 25),

                RecommendedFoodSection(),

                SizedBox(height: 48),

                //========================= Bottom Categories Food Card ==============
                CategoriesFoodSection(tabController: tabController),
                //SizedBox(height: screenHeight < 700 ? 35 : 0),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
