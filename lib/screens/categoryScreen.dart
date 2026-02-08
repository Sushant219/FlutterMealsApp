import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/mealScreen.dart';
import 'package:mealsapp/data/category.dart';
import '../widgets/simple_category_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key, required this.availableMeals
  });

  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(
                title: category.title, // optional improvement
                meals: filteredMeals
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      padding: const EdgeInsets.all(16),
      itemCount: availableCategories.length,
      itemBuilder: (context, index) {
        final category = availableCategories[index];
        final animation = CurvedAnimation(
            parent: _animationController,
            curve: Interval(index / availableCategories.length,
              1,
              curve: Curves.bounceIn,
            )
        );

        return AnimatedBuilder(
          animation: animation,
          child: SimpleCategoryCard(
            image: category.image,
            text: category.title,
            onTap: () => _selectCategory(context, category),
          ),
          builder: (context, child) =>
              FadeTransition(opacity: animation,
                child: SlideTransition(position: Tween(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                  child: child,
                ),
              ),
        );
      },
    );
  }
}