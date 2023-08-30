// ignore_for_file: public_member_api_docs

import 'package:api_client/src/models/models.dart';
import 'package:equatable/equatable.dart';

class Card extends Equatable {
  const Card({
    required this.object,
    required this.id,
    required this.set,
    required this.oracleId,
    required this.multiverseIds,
    required this.tcgPlayerId,
    required this.cardMarketId,
    required this.name,
    required this.lang,
    required this.releasedAt,
    required this.uri,
    required this.scryfallUri,
    required this.layout,
    required this.highResImage,
    required this.imageStatus,
    required this.imageUris,
    required this.manaCost,
    required this.cmc,
    required this.typeLine,
    required this.oracleText,
    required this.colors,
    required this.colorIdentity,
    required this.keywords,
    required this.legalities,
    required this.games,
    required this.reserved,
    required this.foil,
    required this.nonfoil,
    required this.finishes,
    required this.oversized,
    required this.promo,
    required this.reprint,
    required this.variation,
    required this.setId,
    required this.setName,
    required this.setType,
    required this.setUri,
    required this.setSearchUri,
    required this.scryfallSetUri,
    required this.rulingsUri,
    required this.printsSearchUri,
    required this.collectorNumber,
    required this.digital,
    required this.rarity,
    required this.cardBackId,
    required this.artist,
    required this.artistIds,
    required this.illustrationId,
    required this.borderColor,
    required this.frame,
    required this.securityStamp,
    required this.fullArt,
    required this.textless,
    required this.booster,
    required this.storySpotlight,
    required this.edhrecRank,
    required this.pennyRank,
    required this.prices,
    required this.relatedUris,
    required this.purchaseUris,
  });
  final String object;
  final String id;
  final String oracleId;
  final List<int> multiverseIds;
  final int tcgPlayerId;
  final int cardMarketId;
  final String name;
  final String lang;
  final String releasedAt;
  final String uri;
  final String scryfallUri;
  final String layout;
  final bool highResImage;
  final String imageStatus;
  final ImageURIs imageUris;
  final String manaCost;
  final int cmc;
  final String typeLine;
  final String oracleText;
  final List<String> colors;
  final List<String> colorIdentity;
  final List<String> keywords;
  final Legalities legalities;
  final List<String> games;
  final bool reserved;
  final bool foil;
  final bool nonfoil;
  final List<String> finishes;
  final bool oversized;
  final bool promo;
  final bool reprint;
  final bool variation;
  final String setId;
  final String set;
  final String setName;
  final String setType;
  final String setUri;
  final String setSearchUri;
  final String scryfallSetUri;
  final String rulingsUri;
  final String printsSearchUri;
  final String collectorNumber;
  final bool digital;
  final String rarity;
  final String cardBackId;
  final String artist;
  final List<String> artistIds;
  final String illustrationId;
  final String borderColor;
  final String frame;
  final String securityStamp;
  final bool fullArt;
  final bool textless;
  final bool booster;
  final bool storySpotlight;
  final int edhrecRank;
  final int pennyRank;
  final Prices prices;
  final RelatedURIs relatedUris;
  final PurchaseURIs purchaseUris;

  @override
  List<Object?> get props => [
        object,
        id,
        oracleId,
        multiverseIds,
        tcgPlayerId,
        cardMarketId,
        name,
        lang,
        releasedAt,
        uri,
        scryfallSetUri,
        layout,
        highResImage,
        imageStatus,
        imageUris,
        manaCost,
        cmc,
        typeLine,
        oracleText,
        colors,
        colorIdentity,
        keywords,
        legalities,
        games,
        reserved,
        foil,
        nonfoil,
        finishes,
        oversized,
        promo,
        reprint,
        variation,
        setId,
        set,
        setName,
        setType,
        setUri,
        setSearchUri,
        scryfallSetUri,
        rulingsUri,
        printsSearchUri,
        collectorNumber,
        digital,
        rarity,
        cardBackId,
        artist,
        artistIds,
        illustrationId,
        borderColor,
        frame,
        securityStamp,
        fullArt,
        textless,
        booster,
        storySpotlight,
        edhrecRank,
        pennyRank,
        prices,
        relatedUris,
        purchaseUris,
      ];
}
