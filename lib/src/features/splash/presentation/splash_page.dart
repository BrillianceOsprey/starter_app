import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:lottie/lottie.dart';
import 'package:starter_app/src/routes/app_router.gr.dart';
import 'package:starter_app/src/shared/constants/asset_paths.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  bool expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 1))
        .then(
          (value) => Future.delayed(const Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then((value) {
              context.router.pushAndPopUntil(
                const SkeletonRoute(),
                predicate: (predicate) => false,
              );
            }),
          ),
        );

    // _init();
    super.initState();
  }

  // _init() {
  //   const splashDuration = Duration(seconds: 2);

  //   Future.delayed(splashDuration, () {
  //     context.router.pushAndPopUntil(
  //       const SkeletonRoute(),
  //       predicate: (predicate) => false,
  //     );
  //   });
  // }

  @override
  void dispose() {
    _lottieAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: GoogleFonts.varelaRound().copyWith(
                fontSize: !expanded ? _bigFontSize : 40,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text('S'),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'hop Here',
          style: GoogleFonts.varelaRound().copyWith(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        LottieBuilder.asset(
          AssetPaths.lottieShop,
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 100,
          width: 100,
          controller: _lottieAnimation,
        ),
      ],
    );
  }
}
