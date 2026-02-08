import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item_traits.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key,
    required this.meal,
    required this.onSelectMeal
  });

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  String complexityTotext(dynamic e) {
    String text = e
        .toString()
        .split('.')
        .last;
    return text[0].toUpperCase() + text.substring(1);
  }

  String affordabilityTotext(dynamic e) {
    String text = e
        .toString()
        .split('.')
        .last;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [

            /// IMAGE
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: CachedNetworkImageProvider(meal.imageUrl),
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),

            /// GRADIENT OVERLAY (instead of black container)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(.75),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            /// CONTENT
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      _chip(const Icon(Icons.attach_money_outlined,
                          color: Colors.white70, size: 16),
                          affordabilityTotext(meal.affordability)),
                      const SizedBox(width: 8),
                      _chip(const Icon(Icons.work_outline,
                          color: Colors.white70, size: 16),
                          complexityTotext(meal.complexity)),
                      const SizedBox(width: 8),
                      const Spacer(),

                      const Icon(Icons.watch_later_outlined,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${meal.duration} Min",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(Icon icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}