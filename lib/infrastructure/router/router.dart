import 'package:bank_sp/features/home/presentation/pages/home_screen.dart';
import 'package:bank_sp/features/login/presentation/pages/welcome_screen/welcome_screen.dart';
import 'package:bank_sp/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'),
        );
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      },
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Transact', icon: Icon(Icons.settings)),
          NavigationDestination(label: 'QR', icon: Icon(Icons.settings)),
          NavigationDestination(label: 'Deposit', icon: Icon(Icons.settings)),
          NavigationDestination(label: 'Product', icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorTransactKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellTransact');
  static final _shellNavigatorQRKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellQR');
  static final _shellNavigatorDepositKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellDeposit');
  static final _shellNavigatorProductKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellProduct');

  /// PATH CONFIG
  static String rootPath = '/';

  static String homePath = '/home';
  static String profileName = 'profile';
  static String profilePath = '/profile';

  static String transactPath = '/transact';

  static String qrPath = '/qr';

  static String depositPath = '/deposit';

  static String productPath = '/product';

  static final goRouter = GoRouter(
    initialLocation: rootPath,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: rootPath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: WelcomeScreen(),
        ),
      ),
      // Stateful navigation based on:
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorTransactKey,
            routes: [
              GoRoute(
                path: transactPath,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Container(),
                ),
                routes: [
                  GoRoute(
                    path: 'details',
                    builder: (context, state) => Container(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorQRKey,
            routes: [
              GoRoute(
                path: qrPath,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Container(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDepositKey,
            routes: [
              GoRoute(
                path: depositPath,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Container(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProductKey,
            routes: [
              GoRoute(
                path: productPath,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: Container(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: profilePath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfileScreen(),
        ),
      ),
    ],
  );
}
