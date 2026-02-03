import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/provider/favorite_providers.dart';
import 'package:mealsapp/screens/categoryScreen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/mealScreen.dart';
import 'package:mealsapp/widgets/side_drawer.dart';



class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen>{
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message){

  }



  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
      print("Page Index Is ${_selectedPageIndex}");
    });
  }


  Map<Filter, bool> _selectedFilters = {};

  void _onSelectSideDrawer(String id) async {
    Navigator.of(context).pop();

    if (id == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentFilter: _selectedFilters,
          ),
        ),
      );

      if (result != null) {
        setState(() {
          _selectedFilters = result;
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      availableMeals: dummyMeals,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(meals: favoriteMeals);
      activePageTitle ="Favorites"; // Now This activePageTitle Will Be Displayed In Our AppBar Title
    }
    return Scaffold(
      appBar: AppBar(
        // This Title Will Be Dynamically.
        // And It Should Depend On Tab,Which Tab It Showing.
        title: Text(activePageTitle),
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
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]
      ),
    );
  }
}
