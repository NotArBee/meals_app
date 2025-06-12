import 'package:flutter/material.dart';

class MealInfoItem extends StatelessWidget {
  const MealInfoItem({
    super.key,
    required this.mealInfo,
    required this.icon,
  });

  final String mealInfo;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          mealInfo,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
