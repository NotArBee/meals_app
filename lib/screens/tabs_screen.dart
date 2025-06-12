import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMeassage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
    ));
  }

  void _toggleMealFavorite(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMeassage('Meal is no longer a favorite');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMeassage('Marked as favorite');
      });
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (context) => FilterScreen(
              currentFilters: _selectedFilters,
            ),
          ));
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavoriteMeal: _toggleMealFavorite,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick Your Categories';

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
          meals: _favoriteMeals, onToggleFavoriteMeal: _toggleMealFavorite);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        unselectedIconTheme:
            IconThemeData(color: Colors.grey.withOpacity(0.65)),
        selectedIconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood_outlined,
              ),
              label: 'Meals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: 'Favorite')
        ],
      ),
    );
  }
}
