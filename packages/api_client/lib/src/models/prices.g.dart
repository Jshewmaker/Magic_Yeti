// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      usd: (json['usd'] as num?)?.toDouble(),
      usdFoil: (json['usdFoil'] as num?)?.toDouble(),
      usdEtched: (json['usdEtched'] as num?)?.toDouble(),
      eur: (json['eur'] as num?)?.toDouble(),
      eurFoil: (json['eurFoil'] as num?)?.toDouble(),
      tix: (json['tix'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'usd': instance.usd,
      'usdFoil': instance.usdFoil,
      'usdEtched': instance.usdEtched,
      'eur': instance.eur,
      'eurFoil': instance.eurFoil,
      'tix': instance.tix,
    };
