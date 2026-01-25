import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/custom_Text.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key,
    required this.meal,
    required this.onToggledFavorite
  });

  final Meal meal;
  final void Function(Meal meal) onToggledFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggledFavorite(meal);
          },
              icon: const Icon(Icons.favorite)
          ),
        ],
      ),
      body: Column(
        children: [
          FadeInImage(placeholder: MemoryImage(kTransparentImage),
            image:  CachedNetworkImageProvider(meal.imageUrl),
            //fadeInDuration:const Duration(milliseconds: 300) ,
            width: double.infinity,
            height:300,
          ),
          Text('Ingredients',style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),),
          SizedBox(height: 10),
          for(final ingrediant in meal.ingredients)
            CustomText(data: ingrediant),
          SizedBox(height: 10),
          Text('Steps',style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),),
          SizedBox(height: 10),
          for(final step in meal.steps)
            CustomText(data: step),

        ],
      ),
    );
  }
}
