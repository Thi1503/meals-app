import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/filters.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  // Lưu giá trị lọc của filter
  Map<Filter, bool> _selectedFilters = kInitialFilter;

  // danh sách món ăn yêu thích
  final List<Meal> _favoriteMeals = [];

  // Thông báo trạng thái yêu thích
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // thêm hoặc xóa 1 món ăn khỏi danh sách yêu thích
  void _toggleFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite. ');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  //Lựa chọn page
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Chọn màn hình hiển thị dựa vào từ khóa
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
     final result= await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(
          builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilters),
        ),
      );
     setState(() {
       _selectedFilters = result ?? kInitialFilter;
     });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
