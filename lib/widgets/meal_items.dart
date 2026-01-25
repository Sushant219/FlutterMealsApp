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
  final void Function(BuildContext context,Meal meal) onSelectMeal;

  String complexityTotext(dynamic e){
    String text = e.toString().split('.').last;
    return text[0].toUpperCase() + text.substring(1);
  }
  String affordabilityTotext(dynamic e){
    String text = e.toString().split('.').last;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: (){
          onSelectMeal(context,meal);
        },
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
                image:  CachedNetworkImageProvider(meal.imageUrl),
              fadeInDuration:const Duration(milliseconds: 300) ,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44,
                  ),
                  child: Column(
                    children: [
                      Text(meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Row(
                        children: [
                          MealItemTraits(
                              icon:Icons.watch_later_outlined,
                              text: "${meal.duration}Min"
                          ),
                          SizedBox(width: 25),
                          MealItemTraits(icon:Icons.work,
                              text:complexityTotext(meal.complexity),
                          ),
                          SizedBox(width: 25),
                          MealItemTraits(icon: Icons.attach_money,
                              text:affordabilityTotext(meal.affordability)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
