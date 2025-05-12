import 'package:crypto_coin_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coin_list/features/crypto_list//crypto_list.dart';

final routes = {
  '/': (context) => CryptoListScreen(),
  '/details': (context) => CryptoCoinScreen(),
};
