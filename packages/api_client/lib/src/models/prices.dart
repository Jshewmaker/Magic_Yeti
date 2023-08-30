// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class Prices extends Equatable {
  const Prices({
    required this.usd,
    required this.usdFoil,
    required this.usdEtched,
    required this.eur,
    required this.eurFoil,
    required this.tix,
  });
  final double? usd;
  final double? usdFoil;
  final double? usdEtched;
  final double? eur;
  final double? eurFoil;
  final double? tix;

  @override
  // TODO: implement props
  List<Object?> get props => [
        usd,
        usdFoil,
        usdEtched,
        eur,
        eurFoil,
        tix,
      ];
}
