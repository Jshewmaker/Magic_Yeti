// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCards _$SearchCardsFromJson(Map<String, dynamic> json) => SearchCards(
      object: json['object'] as String,
      totalCards: json['totalCards'] as int,
      hasMore: json['hasMore'] as bool,
      nextPage: json['nextPage'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchCardsToJson(SearchCards instance) =>
    <String, dynamic>{
      'object': instance.object,
      'totalCards': instance.totalCards,
      'hasMore': instance.hasMore,
      'nextPage': instance.nextPage,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
