import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'coin_screen_state.dart';

class CoinScreen extends ConsumerWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownAddress = ref.watch(coinScreenStateProvider).ownAddress;
    final balance = ref.watch(coinScreenStateProvider).balance;
    final onPressedUpdateButton =
        ref.read(coinScreenStateProvider.notifier).onPressedUpdateButton;
    final walletConnected = ref.read(coinScreenStateProvider).walletConnected;

    return Center(
      child: Column(
        children: [
          IconButton(
            iconSize: 32,
            icon: const Icon(Icons.update),
            onPressed: onPressedUpdateButton,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      'TC',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'address : ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      ownAddress,
                      style: const TextStyle(fontSize: 9.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                //backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(200.0, 52.0),
                shape: const StadiumBorder(),
                //textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: walletConnected
                  ? () {
                      context.push('/coin/coin_transfer');
                    }
                  : null,
              child: const Text('transfer'),
            ),
          ),
        ],
      ),
    );
  }
}
