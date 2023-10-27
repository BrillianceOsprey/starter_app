import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/features/app/presentation/widgets/bottom_navigationbar.dart';
import 'package:starter_app/src/features/home/presentation/home_page.dart';
import 'package:starter_app/src/features/setting/presentation/setting_page.dart';

class SkeletonPage extends HookConsumerWidget {
  const SkeletonPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const routePages = [HomePage(), SettingPage()];
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: routePages.elementAt(1),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
