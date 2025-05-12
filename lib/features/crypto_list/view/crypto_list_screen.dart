import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coin_list/repos/crypto_coins/crypto_coins.dart';
import 'package:crypto_coin_list/features/crypto_list/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Crypto List'),
      ),
      body: (_cryptoCoinList == null)
          ? const SizedBox()
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, Index) => Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          await loadCryptoCoins();
        },
      ),
    );
  }

  Future<void> loadCryptoCoins() async {
    _cryptoCoinList = await GetIt.I<AbstractCoinsRepo>().getCoinList();
    setState(() {});
  }
}
