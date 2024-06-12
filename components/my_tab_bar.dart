import 'package:flutter/material.dart';
import 'package:test_2/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((Category) {
      return Tab(
        text: Category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs()
      ),
    );
  }
}
