import 'package:flutter/material.dart';

class FilterItem extends StatefulWidget {
  const FilterItem(
      {super.key,
      required this.filterSetCategory,
      required this.filterTitle,
      required this.filterSubtitle,
      required this.onChanged});

  @override
  State<StatefulWidget> createState() => _FilterItem();

  final bool filterSetCategory;
  final void Function(bool) onChanged;
  final String filterTitle;
  final String filterSubtitle;
}

class _FilterItem extends State<FilterItem> {
  late bool isFilterSetCategoryChecked;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.filterSetCategory,
      onChanged: widget.onChanged,
      title: Text(
        widget.filterTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(widget.filterSubtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
    );
  }
}
