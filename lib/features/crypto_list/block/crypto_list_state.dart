part of 'crypto_list_block.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class cryptoListLoaded extends CryptoListState {
  cryptoListLoaded({required this.cryptoCoinList});

  final List<CryptoCoin> cryptoCoinList;
}

class CryptoListError extends CryptoListState {
  CryptoListError({this.exception});

  final Object? exception;
}
