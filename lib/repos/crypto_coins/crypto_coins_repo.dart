import 'package:dio/dio.dart';
import 'package:crypto_coin_list/repos/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepo implements AbstractCoinsRepo {
  CryptoCoinsRepo({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AID,CAG,SOL&tsyms=USD,EUR');
    final data = response.data as Map<String, dynamic>;
    final dataRow = data['RAW'] as Map<String, dynamic>;
    final coinList = dataRow.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return coinList;
  }
}
