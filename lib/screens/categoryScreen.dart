import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/mealScreen.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

import '../data/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggledFavorite
  });

  final void Function(Meal meal) onToggledFavorite;

  void _selectCategory(BuildContext context,Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title, // optional improvement
          meals: filteredMeals, onToggledFavorite:onToggledFavorite,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2
          ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: (){
              _selectCategory(context,category);
            }),
        ],
    );
  }
}
