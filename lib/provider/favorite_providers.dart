import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


import 'package:mealsapp/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier(): super([]);

  bool toggleMealStatus(Meal meals){
    final mealIsFavorite = state.contains(meals);

    if(mealIsFavorite){
      state = state.where((meal) => meal.
      id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}


final favoriteMealsProvider =
StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

