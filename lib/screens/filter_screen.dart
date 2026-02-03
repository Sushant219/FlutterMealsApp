import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/switch_list_tile.dart';

enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<Filter,bool> currentFilter ;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _veganFreeFilterSet= false;
  var _vegetarianFilterSet= false;
  var _lactoseFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]!;
    _veganFreeFilterSet = widget.currentFilter[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilter[Filter.vegetarian]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          debugPrint("Inital State Of ${didPop}");
          if(didPop) return;
          debugPrint("After Back Button Pressed State Of ${didPop}");
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTileItems(
              value: _glutenFreeFilterSet,
              onChanged: (bool value) {
                setState(() {
                  _glutenFreeFilterSet = value;
                });
              },
              title:"Gluten Free",
              subtitle:"Only include gluten free meals",
            ),
            SwitchListTileItems(
                value: _veganFreeFilterSet,
                onChanged: (bool value){
                  setState(() {
                    _veganFreeFilterSet = value;
                  });
                },
                title: "Vegan Free",
                subtitle: "Only include vegan free meals"
            ),
            SwitchListTileItems(
                value: _vegetarianFilterSet,
                onChanged: (bool value){
                  setState(() {
                    _vegetarianFilterSet = value;
                  });
                },
                title: "Veg Free",
                subtitle: "Only include veg free meals"
            ),
            SwitchListTileItems(
                value: _lactoseFreeFilterSet,
                onChanged: (bool value){
                  setState(() {
                    _lactoseFreeFilterSet = value;
                  });
                },
                title: "Lactose Free",
                subtitle: "Only include lactose free meals"
            ),
          ],
        ),
      ),
    );
  }
}
