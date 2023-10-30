import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/app/presentation/views/bottom_nav_controller.dart';
import 'package:starter_app/src/l10n/locale_keys.g.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavControllerProvider) ?? 0;

    return NavigationBar(
      indicatorColor: Theme.of(context).colorScheme.inversePrimary,
      animationDuration: const Duration(milliseconds: 400),
      selectedIndex: index,
      onDestinationSelected: (index) => ref
          .read(bottomNavControllerProvider.notifier)
          .setAndPersistValue(index),
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: LocaleKeys.nav_home.tr(),
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: LocaleKeys.nav_settings.tr(),
        ),
      ],
    );

    // return Card(
    //   margin: const EdgeInsets.only(top: 1, right: 4, left: 4),
    //   elevation: 4,
    //   shadowColor: Theme.of(context).colorScheme.shadow,
    //   color: Theme.of(context).colorScheme.surfaceVariant,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(16),
    //       topRight: Radius.circular(16),
    //     ),
    //   ),
    //   child: BottomNavigationBar(
    //     currentIndex: index,
    //     onTap: (idx) => ref
    //         .read(bottomNavControllerProvider.notifier)
    //         .setAndPersistValue(idx),
    //     type: BottomNavigationBarType.fixed,
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //     selectedItemColor: Theme.of(context).colorScheme.primary,
    //     unselectedItemColor: Theme.of(context).textTheme.bodySmall!.color,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: const Icon(Ionicons.home_outline),
    //         label: LocaleKeys.nav_home.tr(),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: const Icon(Ionicons.settings_outline),
    //         label: LocaleKeys.nav_settings.tr(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
