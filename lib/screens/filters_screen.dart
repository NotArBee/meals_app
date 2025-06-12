import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_item.dart';

enum Filter { glutenFree, lactoseFree, vegan, vegetarian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _veganFilterSet = false;
  bool _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.pop(context, {
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
        },
        child: Column(
          children: [
            FilterItem(
              filterSetCategory: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              filterTitle: 'Gluten-free',
              filterSubtitle: 'Only include gluten-free meals',
            ),
            FilterItem(
              filterSetCategory: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              filterTitle: 'Lactose-free',
              filterSubtitle: 'Only include lactose-free meals',
            ),
            FilterItem(
              filterSetCategory: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              filterTitle: 'Vegan',
              filterSubtitle: 'Only include vegan meals',
            ),
            FilterItem(
              filterSetCategory: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              filterTitle: 'Vegetarian',
              filterSubtitle: 'Only include vegetarian meals',
            ),
          ],
        ),
      ),
    );
  }
}
