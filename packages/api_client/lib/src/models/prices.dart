// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prices.g.dart';

@JsonSerializable(explicitToJson: true)
class Prices extends Equatable {
  const Prices({
    required this.usd,
    required this.usdFoil,
    required this.usdEtched,
    required this.eur,
    required this.eurFoil,
    required this.tix,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);

  final double? usd;
  final double? usdFoil;
  final double? usdEtched;
  final double? eur;
  final double? eurFoil;
  final double? tix;

  @override
  List<Object?> get props => [
        usd,
        usdFoil,
        usdEtched,
        eur,
        eurFoil,
        tix,
      ];
}
