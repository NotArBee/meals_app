import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 50,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.restaurant,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(
                    'Meals',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  onTap: () {
                    onSelectScreen('meals');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(
                    'Filters',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  onTap: () {
                    onSelectScreen('filters');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
