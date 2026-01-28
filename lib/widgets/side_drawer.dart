import 'package:flutter/material.dart';
class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelectDrawerScreen});


  final void Function (String Identifier) onSelectDrawerScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onBackground,
              ),
              child:
              Row(
                children: [
                  Icon(Icons.fastfood,size: 48,color: Theme.of(context).colorScheme.primary,),
                  const SizedBox(width: 18),
                  Text(
                    "Cooking Up!",
                    style:Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background
                    ) ,),
                ],
              )
          ),
          ListTile(
            leading: Icon(
                Icons.restaurant,
              size: 26,
                color: Theme.of(context).colorScheme.onBackground,
            ),
            title:  Text(
              "Meals",
              style:Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ) ,),
            onTap: (){
              onSelectDrawerScreen("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title:  Text(
              "Filters",
              style:Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              ) ,),
            onTap: (){
              onSelectDrawerScreen("filters");
            },
          ),


        ],
      ),
    );
  }
}