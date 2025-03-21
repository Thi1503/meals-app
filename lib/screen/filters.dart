import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            valueFilterSet: activeFilters[Filter.glutenFree]!,
            titleText: 'Gluten-free',
            subtitleText: 'Only include gluten-free meals',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
          ),
          FilterItem(
            valueFilterSet: activeFilters[Filter.lactoseFree]!,
            titleText: 'Lactose-free',
            subtitleText: 'Only include lactose-free meals',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          FilterItem(
            valueFilterSet: activeFilters[Filter.vegetarian]!,
            titleText: 'Vegetarian',
            subtitleText: 'Only include vegetarian meals',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
          ),
          FilterItem(
            valueFilterSet:activeFilters[Filter.vegan]!,
            titleText: 'Vegan',
            subtitleText: 'Only include vegan meals',
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
