import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/coin/coin_transfer_screen.dart';
import '../../ui/coin/coin_screen.dart';
import '../../ui/ethereum_home/ethereum_screen.dart';
import '../../ui/nft_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _childNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'child');

class TabPageSetting {
  TabPageSetting({
    required this.path,
    required this.label,
    required this.icon,
  });
  final String path;
  final String label;
  final Widget icon;
}

class TabPageSettings {
  static const tabPathEthereumHome = 'ethereum';
  static const tabPathCoin = 'coin';
  static const tabPathNft = 'nft';
  static final List<TabPageSetting> data = [
    TabPageSetting(
      path: tabPathEthereumHome,
      label: 'Ethereum',
      icon: const Icon(Icons.home),
    ),
    TabPageSetting(
      path: tabPathCoin,
      label: 'Coin',
      icon: const Icon(Icons.currency_bitcoin),
    ),
    TabPageSetting(
      path: tabPathNft,
      label: 'NFT',
      icon: const Icon(Icons.badge),
    ),
  ];
}

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/ethereum',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _childNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/ethereum',
              builder: (BuildContext context, GoRouterState state) =>
                  const EthereumHomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/coin',
              builder: (BuildContext context, GoRouterState state) =>
                  const CoinScreen(),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: 'coin_transfer',
                  builder: (context, state) => const CoinTransferScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/nft',
              builder: (BuildContext context, GoRouterState state) =>
                  const NftScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);


class ScaffoldWithNavBar extends StatelessWidget {
    ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  final bottomNavigationBarItems = TabPageSettings.data.map((tabSetting) {
    return BottomNavigationBarItem(
      icon: tabSetting.icon,
      label: tabSetting.label,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItems,
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({
    Key? key,
    this.trailingWidget,
  }) : super(key: key);

  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0.0);
}
