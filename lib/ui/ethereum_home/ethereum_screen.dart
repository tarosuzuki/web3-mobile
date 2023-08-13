import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ethereum_screen_state.dart';

class EthereumHomeScreen extends ConsumerWidget {
  const EthereumHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(ethereumScreenStateProvider).balance;
    final address = ref.watch(ethereumScreenStateProvider).address;
    final walletConnectServiceInitialized =
        ref.watch(ethereumScreenStateProvider).walletConnectServiceInitialized;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Balance',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  balance,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Text(
                'ETH',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'address : ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  address,
                  style: const TextStyle(fontSize: 9.0),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              minimumSize: const Size(200.0, 52.0),
              shape: const StadiumBorder(),
            ),
            onPressed: walletConnectServiceInitialized
                ? () {
                    ref
                        .read(ethereumScreenStateProvider.notifier)
                        .openConnectWalletModal(context);
                  }
                : null,
            child: const Text('connect wallet'),
          ),
        ],
      ),
    );
  }
}
