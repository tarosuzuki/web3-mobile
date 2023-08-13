abstract class CoinService {
  Future<BigInt?> getBalance({required String addressHex});
  Future transfer({required String toAddress, required BigInt value});
}