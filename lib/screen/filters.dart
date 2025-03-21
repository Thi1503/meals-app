import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';


enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters  });
  final Map<Filter,bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;
  @override
  void initState() {

    super.initState();
     _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
     _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
     _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
     _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            FilterItem(
              valueFilterSet: _glutenFreeFilterSet,
              titleText: 'Gluten-free',
              subtitleText: 'Only include gluten-free meals',
              onChanged: (value) {
                setState(() {
                  _glutenFreeFilterSet = value;
                });
              },
            ),
            FilterItem(
              valueFilterSet: _lactoseFreeFilterSet,
              titleText: 'Lactose-free',
              subtitleText: 'Only include lactose-free meals',
              onChanged: (value) {
                setState(() {
                  _lactoseFreeFilterSet = value;
                });
              },
            ),
            FilterItem(
              valueFilterSet: _vegetarianFilterSet,
              titleText: 'Vegetarian',
              subtitleText: 'Only include vegetarian meals',
              onChanged: (value) {
                setState(() {
                  _vegetarianFilterSet = value;
                });
              },
            ),
            FilterItem(
              valueFilterSet: _veganFilterSet,
              titleText: 'Vegan',
              subtitleText: 'Only include vegan meals',
              onChanged: (value) {
                setState(() {
                  _veganFilterSet = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
