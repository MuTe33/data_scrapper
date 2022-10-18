// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEvent _$FeedEventFromJson(Map<String, dynamic> json) => FeedEvent(
      hash: json['transaction_hash'] as String,
      timestamp: json['timestamp'] as int,
      tx: FeedTx.fromJson(json['transaction'] as Map<String, dynamic>),
      eventPlace: $enumDecode(_$FeedEventPlaceEnumMap, json['event_place']),
      txType: $enumDecode(_$FeedTxTypeEnumMap, json['transaction_type']),
      txFee: (json['transaction_fee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeedEventToJson(FeedEvent instance) => <String, dynamic>{
      'transaction_hash': instance.hash,
      'timestamp': instance.timestamp,
      'transaction': instance.tx,
      'event_place': _$FeedEventPlaceEnumMap[instance.eventPlace]!,
      'transaction_type': _$FeedTxTypeEnumMap[instance.txType]!,
      'transaction_fee': instance.txFee,
    };

const _$FeedEventPlaceEnumMap = {
  FeedEventPlace.opensea: 'opensea',
  FeedEventPlace.gem: 'gem',
  FeedEventPlace.x2y2: 'x2y2',
  FeedEventPlace.looksrare: 'looksrare',
  FeedEventPlace.foundation: 'foundation',
  FeedEventPlace.rarible: 'rarible',
  FeedEventPlace.superrare: 'superrare',
  FeedEventPlace.cryptoPunks: 'cryptoPunks',
  FeedEventPlace.zora: 'zora',
  FeedEventPlace.nouns: 'nouns',
  FeedEventPlace.lilNouns: 'lilNouns',
  FeedEventPlace.zerox: 'zerox',
  FeedEventPlace.unknown: 'unknown',
};

const _$FeedTxTypeEnumMap = {
  FeedTxType.mint: 'mint',
  FeedTxType.purchase: 'purchase',
  FeedTxType.sell: 'sell',
  FeedTxType.send: 'send',
  FeedTxType.receive: 'receive',
  FeedTxType.burn: 'burn',
  FeedTxType.unknown: 'unknown',
};
