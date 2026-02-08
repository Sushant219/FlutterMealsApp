import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/provider/favorite_providers.dart';
import 'package:mealsapp/widgets/custom_Text.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal
  });

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // i am watching here whether my favoriteMeals contains any item or not;
    // Based on that my UI will respond;
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider.notifier).toggleMealStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite ? "Meal removed" : "Meal added..."),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(12),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: CachedNetworkImageProvider(meal.imageUrl),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (final ingredient in meal.ingredients)
                      CustomText(data: ingredient),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Steps',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    for (final step in meal.steps)
                      CustomText(data: step),
                  ],
                ),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
