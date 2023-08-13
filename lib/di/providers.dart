import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/ethereum_config.dart';
import '../../config/sepolia_ethereum_config.dart';
import '../../data/coin/cloud_coin_service.dart';
import '../../data/coin/coin_service.dart';
import '../../data/ethereum/cloud_ethereum_service.dart';
import '../../data/ethereum/ethereum_service.dart';
import '../../data/wallet_connect/wallet_connect_service.dart';
import '../../data/wallet_connect/wallet_connect_service_impl.dart';

import '../logger/logger.dart';
import '../logger/logger_impl.dart';

final loggerProvider = Provider<Logger>((ref) {
  return LoggerImpl();
});

final ethereumConfigProvider = Provider<EthereumConfig>((ref) {
  return SepoliaEthereumConfig();
});

final ethereumServiceProvider = Provider<EthereumService>((ref) {
  return CloudEthereumService(
    ethereumConfig: ref.read(ethereumConfigProvider),
    logger: ref.read(loggerProvider),
  );
});

final walletConnectServiceProvider = Provider<WalletConnectService>((ref) {
  return WalletConnectServiceImpl(
    ethereumConfig: ref.read(ethereumConfigProvider),
    logger: ref.read(loggerProvider),
  );
});

final coinServiceProvider = Provider<CoinService>((ref) {
  return CloudCoinService(
    ethereumConfig: ref.read(ethereumConfigProvider),
    walletConnectService: ref.read(walletConnectServiceProvider),
  );
});
