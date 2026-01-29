import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:provider/provider.dart';
class FavoriteProviders extends ChangeNotifier{

  final List<Meal>_favoriteMeals = [];

  List<Meal> get favoriteMeals {
    return List.unmodifiable(_favoriteMeals);
  }

  void toggleToFavoriteMeals(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      _favoriteMeals.remove(meal);
    }else{
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }


}