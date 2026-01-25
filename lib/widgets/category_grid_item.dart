import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category,required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap:onSelectCategory,
        splashColor: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  category.color.withOpacity(0.55),
                  category.color.withOpacity(0.9),
                ] ,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              category.title,style:Theme.of(context).textTheme.titleLarge!.copyWith(
              color:Theme.of(context).colorScheme.onBackground
            ),
            ),
          ),
        ),
      ),
    );
  }
}
