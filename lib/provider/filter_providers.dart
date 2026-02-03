import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/filter_screen.dart';


enum Filter{
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterProvidersNotifier extends StateNotifier<Map<Filter,bool>> {
  FilterProvidersNotifier():super ({});


}