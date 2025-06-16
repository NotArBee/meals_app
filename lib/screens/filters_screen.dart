import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widgets/filter_item.dart';

import '../providers/filters_meals_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            filterSetCategory: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersMealsProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            filterTitle: 'Gluten-free',
            filterSubtitle: 'Only include gluten-free meals',
          ),
          FilterItem(
            filterSetCategory: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersMealsProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            filterTitle: 'Lactose-free',
            filterSubtitle: 'Only include lactose-free meals',
          ),
          FilterItem(
            filterSetCategory: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersMealsProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            filterTitle: 'Vegan',
            filterSubtitle: 'Only include vegan meals',
          ),
          FilterItem(
            filterSetCategory: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersMealsProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            filterTitle: 'Vegetarian',
            filterSubtitle: 'Only include vegetarian meals',
          ),
        ],
      ),
    );
  }
}
