import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/filter_providers.dart';
import 'package:mealsapp/widgets/switch_list_tile.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final filters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTileItems(
            value: filters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: "Gluten Free",
            subtitle: "Only include gluten free meals",
          ),

          SwitchListTileItems(
            value: filters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: "Vegan",
            subtitle: "Only include vegan meals",
          ),

          SwitchListTileItems(
            value: filters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: "Vegetarian",
            subtitle: "Only include vegetarian meals",
          ),

          SwitchListTileItems(
            value: filters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: "Lactose Free",
            subtitle: "Only include lactose free meals",
          ),
        ],
      ),
    );
  }
}
