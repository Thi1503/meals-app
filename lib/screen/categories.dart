import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

import '../models/meal.dart';

// quản lý các màn hình và sự kiện chính

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    super.key,
    required this.availableMeals,
  });
  List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    // select Category on screen
    void _selectCategory(BuildContext context, Category category) {
      final fillteredMeals = availableMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: fillteredMeals,
          ),
        ),
      );
    }

    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        // Show list categories in dummy_data
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
