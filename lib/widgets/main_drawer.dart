import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String indentifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cooking up !',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 30,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: (){
              onSelectScreen('meals');
            },
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(
              Icons.filter_list_alt,
              color: Theme.of(context).colorScheme.onSurface,
              size: 30,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 24,
                  ),
            ),
            onTap: (){
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
