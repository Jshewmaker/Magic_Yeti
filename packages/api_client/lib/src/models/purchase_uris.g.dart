// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_uris.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseURIs _$PurchaseURIsFromJson(Map<String, dynamic> json) => PurchaseURIs(
      tcgPlayer: json['tcgPlayer'] as String,
      cardHoarder: json['cardHoarder'] as String,
      cardMarket: json['cardMarket'] as String,
    );

Map<String, dynamic> _$PurchaseURIsToJson(PurchaseURIs instance) =>
    <String, dynamic>{
      'tcgPlayer': instance.tcgPlayer,
      'cardMarket': instance.cardMarket,
      'cardHoarder': instance.cardHoarder,
    };
