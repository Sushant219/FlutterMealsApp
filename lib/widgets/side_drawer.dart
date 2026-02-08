import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelectDrawerScreen});

  final void Function(String identifier) onSelectDrawerScreen;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Drawer(
      backgroundColor: colors.background,
      child: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.fastfood, size: 42, color: colors.primary),
                  const SizedBox(width: 16),
                  Text(
                    "Cooking Up!",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ],

              ),
            ),

            // MENU CARD
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 2,
              child: Column(
                children: [
                  _DrawerButton(
                    icon: Icons.restaurant,
                    label: "Meals",
                    onTap: () => onSelectDrawerScreen("meals"),
                  ),
                  const Divider(height: 1),
                  _DrawerButton(
                    icon: Icons.settings,
                    label: "Filters",
                    onTap: () => onSelectDrawerScreen("filters"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      leading: Icon(icon, color: colors.primary),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: colors.onSurface,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      onTap: onTap,
    );

  }
}
