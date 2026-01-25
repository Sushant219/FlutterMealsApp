import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categoryScreen.dart';
import 'package:mealsapp/screens/mealScreen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{
int _selectedPageIndex = 0;


void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
    print("Page Index Is ${_selectedPageIndex}");
  });
}

@override
Widget build(BuildContext context) {
  Widget activePage = const CategoryScreen();
  var activePageTitle = "Categories";

  if (_selectedPageIndex == 1) {
    activePage = const MealsScreen(meals: []);
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

