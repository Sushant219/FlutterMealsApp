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
final List<Meal> meals = [];



void _selectPage(int index){
  setState(() {
    _selectedPageIndex = index;
    print("Page Index Is ${_selectedPageIndex}");
  });
}

// This One Is For Side Bar
void _onSelectSideDrawer(String id) async{

  Navigator.of(context).pop(); // It Will Make Sure That The Side Drawer Should Always Close Automatic
  // And if it hits the filter id then it will show the filter page.
  // And after the page open when we close the page the drawer will close automatically.
  if(id == "filters") {
    final result = await Navigator.of(context).push<Map<Filter,bool>>(
        MaterialPageRoute(builder: (context) => const FilterScreen()));
  }
}
// Side Bar End


@override
Widget build(BuildContext context) {
  Widget activePage = CategoryScreen();
  var activePageTitle = "Categories";

  if (_selectedPageIndex == 1) {
    activePage = MealsScreen(meals:meals);
    activePageTitle = "Favorites"; // Now This activePageTitle Will Be Displayed In Our AppBar Title
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

