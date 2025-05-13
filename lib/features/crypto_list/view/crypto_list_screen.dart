import 'package:crypto_coin_list/features/crypto_list/block/crypto_list_block.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coin_list/repos/crypto_coins/crypto_coins.dart';
import 'package:crypto_coin_list/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinList;

  final _cryptoListBlock = CryptoListBlock(GetIt.I<AbstractCoinsRepo>());

  @override
  void initState() {
    _cryptoListBlock.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Crypto List'),
        ),
        body: BlocBuilder<CryptoListBlock, CryptoListState>(
          bloc: _cryptoListBlock,
          builder: (context, state) {
            if (state is cryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.cryptoCoinList.length,
                separatorBuilder: (context, Index) => Divider(),
                itemBuilder: (context, i) {
                  final coin = state.cryptoCoinList[i];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }

            if (state is CryptoListError) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Error loading coins'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _cryptoListBlock.add(LoadCryptoList());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        //  (_cryptoCoinList == null)
        //     ? const SizedBox()
        //     : ListView.separated(
        //         padding: const EdgeInsets.only(top: 16),
        //         itemCount: _cryptoCoinList!.length,
        //         separatorBuilder: (context, Index) => Divider(),
        //         itemBuilder: (context, i) {
        //           final coin = _cryptoCoinList![i];
        //           return CryptoCoinTile(coin: coin);
        //         },
        //       ),
        );
  }
}
