import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/provider/favorite_providers.dart';
import 'package:mealsapp/provider/filter_providers.dart';
import 'package:mealsapp/screens/categoryScreen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/mealScreen.dart';
import 'package:mealsapp/widgets/side_drawer.dart';

import '../provider/theme_providers.dart';



class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
      print("Page Index Is ${_selectedPageIndex}");
    });
  }



  void _onSelectSideDrawer(String id) async {
    Navigator.of(context).pop();
    if (id == "filters") {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),);
      }
  }


  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final activeMeals = ref.watch(filterProvider);
    final filteredMeals = dummyMeals.where((meal){
      if(activeMeals[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(activeMeals[Filter.glutenFree]! && !meal.isGlutenFree){
      return false;
      }
      if(activeMeals[Filter.vegan]! && !meal.isVegan){
      return false;
      }
      if(activeMeals[Filter.vegetarian]! && !meal.isVegetarian){
      return false;
      }
      return true;
    }).toList();


    Widget activePage = CategoryScreen(
      availableMeals: filteredMeals

    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle ="Favorites"; // Now This activePageTitle Will Be Displayed In Our AppBar Title
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).state =
              themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
          ),
        ],
      ),
      drawer: SideDrawer(onSelectDrawerScreen:_onSelectSideDrawer),

      body: activePage,//This Will Show Which Screen Should Be Displayed Based On The Condition.

      bottomNavigationBar: BottomNavigationBar(
        // The On Tap Function Will Trigerd Once The User Tap On It.
        // And It Takes An Integer Value As Parameter.
        // And That Ineger Value Is Index.
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,

          items: const[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]
      ),
    );
  }
}
