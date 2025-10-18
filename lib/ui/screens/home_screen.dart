import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/assets_icons_path.dart';
import 'package:food_ecommerce_app/core/theme/app_colors.dart';
import 'package:food_ecommerce_app/providers/food_data_controller.dart';
import 'package:food_ecommerce_app/ui/screens/my_basket_screen.dart';
import 'package:food_ecommerce_app/ui/screens/my_favorites_screen.dart';
import 'package:food_ecommerce_app/ui/screens/search_filter_section.dart';
import 'package:food_ecommerce_app/ui/widgets/categories_food_section.dart';
import 'package:food_ecommerce_app/ui/widgets/icon_label_button.dart';
import 'package:food_ecommerce_app/ui/widgets/recommended_food_section.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<FoodDataController>().getRecommendedFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    //  final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
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
                    Image.asset(
                      AssetsIconsPath.drawerIcon,
                      width: 22,
                      height: 11,
                    ),

                    Spacer(),

                    //----------- Favorited icon button ------
                    Consumer<FoodDataController>(
                      builder: (context, controller, child) {
                        return Badge(
                          backgroundColor: controller.favoritesCount == 0
                              ? Colors.transparent
                              : Colors.red,
                          label: controller.favoritesCount != 0
                              ? Text(controller.favoritesCount.toString())
                              : null,

                          child: IconLabelButton(
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
                        );
                      },
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
                  style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 24),

                //===================== Search and Filter Section ==============
                SearchFilterSection(),

                //========================== Recommended Food Section =============
                //--------------- Section title -------------------
                SizedBox(height: 39),
                Text(
                  "Recommended Combo",
                  style: TextStyle(
                    color: AppColors.textPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25),

                RecommendedFoodSection(),

                SizedBox(height: 48),

                //=========================  Categories Food Card Tab bar ==============
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
