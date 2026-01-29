import 'package:flutter/material.dart';
import 'package:mealsapp/data/category.dart';
import 'package:mealsapp/screens/meal_details_Screen.dart';
import 'package:mealsapp/widgets/meal_items.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.push(context,
        MaterialPageRoute(builder:(context)=> MealDetailsScreen(
            meal: meal,
           ),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {

    Widget meal_content =  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh..oho...,No Data Found!',style:
            Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground)
            ),
            const SizedBox(height: 10),
            Text('Choose another meal!',style:
            Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground),)
          ],
        ),
      );

    if(meals.isNotEmpty){
      meal_content = ListView.builder(
        itemCount: meals.length,
        itemBuilder:(ctx,index)=> MealItems(meal: meals[index], onSelectMeal: (ctx, meal) {
          selectMeal(ctx, meal);
        },)
      );
    }
    // This Says If Any Of Meal Screen Doesn't Contain The Title Then We Have To Set It Manually.
    // OtherWise It Will Take From Our TabsScreen.
    // This Is A Edge Case.
    if (title == null){
      return meal_content;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body:  meal_content,
    );
  }
}
