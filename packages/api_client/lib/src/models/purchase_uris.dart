// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class PurchaseURIs extends Equatable {
  const PurchaseURIs({
    required this.tcgPlayer,
    required this.cardHoarder,
    required this.cardMarket,
  });

  final String tcgPlayer;
  final String cardMarket;
  final String cardHoarder;

  @override
  List<Object?> get props => [tcgPlayer, cardHoarder, cardMarket];
}
