// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

class RelatedURIs extends Equatable {
  const RelatedURIs({
    required this.gatherer,
    required this.tcgPlayerInfiniteArticles,
    required this.tcgPlayerInfiniteDecks,
    required this.edhrec,
  });

  final String gatherer;
  final String tcgPlayerInfiniteArticles;
  final String tcgPlayerInfiniteDecks;
  final String edhrec;

  @override
  List<Object?> get props => [
        gatherer,
        tcgPlayerInfiniteArticles,
        tcgPlayerInfiniteDecks,
        edhrec,
      ];
}
