import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/provider/favorite_providers.dart';
import 'package:mealsapp/widgets/custom_Text.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal,
  });

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
        actions: [
          Consumer<FavoriteProviders>(
            builder: (ctx, favs, _) => IconButton(
              onPressed: () {
                favs.toggleToFavoriteMeals(meal);
              },
              icon: Icon(
                favs.favoriteMeals.contains(meal)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
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
