// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'legalities.g.dart';

@JsonSerializable(explicitToJson: true)
class Legalities extends Equatable {
  const Legalities({
    required this.standard,
    required this.future,
    required this.historic,
    required this.gladiator,
    required this.pioneer,
    required this.explorer,
    required this.modern,
    required this.legacy,
    required this.pauper,
    required this.vintage,
    required this.penny,
    required this.commander,
    required this.oathBreaker,
    required this.brawl,
    required this.historicBrawl,
    required this.alchemy,
    required this.pauperCommander,
    required this.duel,
    required this.oldschool,
    required this.premodern,
    required this.prEdh,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) =>
      _$LegalitiesFromJson(json);

  Map<String, dynamic> toJson() => _$LegalitiesToJson(this);

  final String standard;
  final String future;
  final String historic;
  final String gladiator;
  final String pioneer;
  final String explorer;
  final String modern;
  final String legacy;
  final String pauper;
  final String vintage;
  final String penny;
  final String commander;
  final String oathBreaker;
  final String brawl;
  final String historicBrawl;
  final String alchemy;
  final String pauperCommander;
  final String duel;
  final String oldschool;
  final String premodern;
  final String prEdh;

  @override
  List<Object?> get props => [
        standard,
        future,
        historic,
        gladiator,
        pioneer,
        explorer,
        modern,
        legacy,
        pauper,
        vintage,
        penny,
        commander,
        oathBreaker,
        brawl,
        historicBrawl,
        alchemy,
        pauperCommander,
        duel,
        oldschool,
        premodern,
        prEdh,
      ];
}
