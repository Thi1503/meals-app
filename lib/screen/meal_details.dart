import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.meal,
    required this.onToggleFavorite
  });

  final Meal meal;

  // xử lý sự kiện thêm xóa món ăn yêu thích
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredient',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 16),
            for (final ingredient in meal.ingredients)
              Text(ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            const SizedBox(height: 16),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
