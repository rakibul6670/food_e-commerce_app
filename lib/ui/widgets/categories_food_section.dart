import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/ui/widgets/recommended_food_section.dart';

class CategoriesFoodSection extends StatelessWidget {
  final TabController tabController;

  const CategoriesFoodSection({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          //dragStartBehavior: DragStartBehavior.down,
          controller: tabController,

          tabs: [
            Tab(text: "Hottest"),
            Tab(text: "Popular"),
            Tab(text: "New Combo"),
            // Tab(
            //   child: Text(
            //     "New Combo",
            //     style: TextStyle(color: Color(0xff938DB5), fontSize: 16),
            //   ),
            // ),
            Tab(text: "Top"),
          ],
        ),
        SizedBox(height: 24),

        SizedBox(
          height: 200,
          child: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: TabBarView(
              children: [
                RecommendedFoodSection(),
                RecommendedFoodSection(),
                RecommendedFoodSection(),
                RecommendedFoodSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
