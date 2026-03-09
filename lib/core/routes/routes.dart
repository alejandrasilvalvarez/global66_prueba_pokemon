import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/pages/pages.dart';
import '../../features/dashboard/presentation/pages/pokedex_detail.dart';
import '../../features/favourites/presentation/view/views.dart';
import '../../features/main_wrapper/view/main_screen_wrapper.dart';
import '../../features/onboarding/presentation/view/views.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/regions/presentation/view/regions_view.dart';

final Provider<GoRouter> routerProvider = Provider<GoRouter>(
  (Ref ref) => GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (BuildContext context, GoRouterState state) =>
            const OnboardingView(),
      ),
      GoRoute(
        path: '/pokemon/:id',
        builder: (BuildContext context, GoRouterState state) {
          int id = int.parse(state.pathParameters['id']!);
          return PokedexDetailView(id: id);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (
              BuildContext context,
              GoRouterState state,
              StatefulNavigationShell navigationShell,
            ) => MainScreen(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/regions',
                builder: (BuildContext context, GoRouterState state) =>
                    const RegionsView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/favourites',
                builder: (BuildContext context, GoRouterState state) =>
                    const FavouritesView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                builder: (BuildContext context, GoRouterState state) =>
                    const ProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);
