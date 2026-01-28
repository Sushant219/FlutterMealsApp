import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/categoryScreen.dart';
import 'package:mealsapp/screens/filter_screen.dart';
import 'package:mealsapp/screens/mealScreen.dart';
import 'package:mealsapp/widgets/side_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{
int _selectedPageIndex = 0;
final List<Meal> _favoriteMeals = [];

void _showInfoMessage(String message){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}


void toggleTheMealFavorite(Meal meal){
  setState(() {
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      _favoriteMeals.remove(meal);
      _showInfoMessage("Meal removed...");
    }else{
      _favoriteMeals.add(meal);
      _showInfoMessage("Meal added...");

    }
  });
}


void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
    print("Page Index Is ${_selectedPageIndex}");
  });
}


void _onSelectSideDrawer(String id){

  Navigator.of(context).pop(); // It Will Make Sure That The Side Drawer Should Always Close Automatic
  // And if it hits the filter id then it will show the filter page.
  // And after the page open when we close the page the drawer will close automatically.
  if(id == "filters") {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const FilterScreen()));
  }
}


@override
Widget build(BuildContext context) {
  Widget activePage = CategoryScreen(onToggledFavorite:toggleTheMealFavorite);
  var activePageTitle = "Categories";

  if (_selectedPageIndex == 1) {
    activePage = MealsScreen(meals: _favoriteMeals, onToggledFavorite:toggleTheMealFavorite);
    print("Meals Screen Activated");
    activePageTitle =
    "Favorites"; // Now This activePageTitle Will Be Displayed In Our AppBar Title
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

