import 'package:crypto_coin_list/repos/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinList();
}
