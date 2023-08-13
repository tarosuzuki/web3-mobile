import 'ethereum_config.dart';

class SepoliaEthereumConfig implements EthereumConfig {
  @override
  String get ethereumRpcUrl => 'https://eth-sepolia.g.alchemy.com/v2/yPNH80XQDSSHh_wHOLiLKSFBFimbuf4T';

  @override
  String get coinContractAddress => '0xA6b324b9eC351cB5BBCC870c890812311B86c712';

  @override
  String get walletConnectProjectId => 'e5956b1d3ddb168b28a8ba71e3896d89';
  @override
  String get walletConnectChainId => 'eip155:11155111';
  @override
  String get walletConnectParingMetadataName => 'Sample Dapp';
  @override
  String get walletConnectParingMetadataDescription => 'Sample Dapp';
  @override
  String get walletConnectParingMetadataUrl => 'https://walletconnect.com/';
  @override
  String get walletConnectParingMetadataIconUrl => 'https://i.imgur.com/sVny9Yi.png';
  @override
  String get walletConnectParingMetadataRedirectAppSchema => 'sampledapp://';
}