import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

// Show chi tiết các món ăn dựa theo category

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title; // nhận vào tiêu đề
  final List<Meal> meals; // nhận vào danh sách các bữa ăn

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No thing in the category !',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category !',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = Scaffold(
        // Hiển thị danh sách bữa ăn
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (context, meal) {
              selectMeal(context, meal);
            },
          ),
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
