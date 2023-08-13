import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walletconnect_modal_flutter/models/walletconnect_modal_theme_data.dart';
import 'package:walletconnect_modal_flutter/widgets/walletconnect_modal_theme.dart';

import 'router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WalletConnectModalTheme(
      data: WalletConnectModalThemeData.lightMode,
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        routerConfig: appRouter,
      ),
    );
  }
}