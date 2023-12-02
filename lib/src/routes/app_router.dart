import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:starter_app/src/routes/app_router.gr.dart';
part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: SkeletonRoute.page, path: '/start'),
      ];
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
