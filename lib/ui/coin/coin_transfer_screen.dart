import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'coin_screen_state.dart';

class CoinTransferScreen extends ConsumerWidget {
  const CoinTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = GlobalKey<FormState>();
    final ownAddress = ref.watch(coinScreenStateProvider).ownAddress;
    final shortOwnAddress = ownAddress.isNotEmpty
        ? '${ownAddress.substring(0, 6)}...${ownAddress.substring(ownAddress.length - 5)}'
        : '';
    final toAddress = ref.watch(coinScreenStateProvider).transferToAddress;
    final amount = ref.watch(coinScreenStateProvider).transferAmount;
    final onSavedToAddress =
        ref.read(coinScreenStateProvider.notifier).onSavedTransferToAddress;
    final onSavedAmount =
        ref.read(coinScreenStateProvider.notifier).onSavedTransferAmount;
    void onPressedTransfer() async {
      form.currentState?.save();
      context.pop();
      await ref.read(coinScreenStateProvider.notifier).onPressedTransfer();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('transfer'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: form,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 72.0,
                              child: Text(
                                'From: ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              shortOwnAddress,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 72.0,
                              child: Text(
                                'To: ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 48.0,
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    //labelText: 'target address',
                                  ),
                                  style: const TextStyle(fontSize: 9.0),
                                  initialValue: toAddress,
                                  keyboardType: TextInputType.text,
                                  onSaved: onSavedToAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0)),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                'Amount: ',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 96.0,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      initialValue: amount.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      keyboardType: TextInputType.number,
                                      /*keyboardType:
                                          const TextInputType.numberWithOptions(
                                              signed: true, decimal: false),
                                       */
                                      onSaved: onSavedAmount,
                                    ),
                                  ),
                                  Text(
                                    'TC',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                minimumSize: const Size(200.0, 52.0),
                shape: const StadiumBorder(),
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: onPressedTransfer,
              child: const Text('transfer'),
            ),
          ),
        ],
      ),
    );
  }
}
