import 'package:crypto_coin_list/repos/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBlock extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBlock(this.coinsRepo) : super(CryptoListInitial()) {
    on<CryptoListEvent>((event, emit) async {
      try {
        final coinList = await coinsRepo.getCoinList();
        emit(cryptoListLoaded(cryptoCoinList: coinList));
      } catch (e) {
        emit(CryptoListError(exception: e));
      }
    });
  }

  final AbstractCoinsRepo coinsRepo;
}
