// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_uris.g.dart';

@JsonSerializable(explicitToJson: true)
class PurchaseURIs extends Equatable {
  const PurchaseURIs({
    required this.tcgPlayer,
    required this.cardHoarder,
    required this.cardMarket,
  });

  factory PurchaseURIs.fromJson(Map<String, dynamic> json) =>
      _$PurchaseURIsFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseURIsToJson(this);

  final String tcgPlayer;
  final String cardMarket;
  final String cardHoarder;

  @override
  List<Object?> get props => [tcgPlayer, cardHoarder, cardMarket];
}
