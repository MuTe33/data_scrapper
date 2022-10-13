// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEvent _$FeedEventFromJson(Map<String, dynamic> json) => FeedEvent(
      hash: json['hash'] as String,
      timestamp: json['timestamp'] as String,
      tx: FeedTx.fromJson(json['tx'] as Map<String, dynamic>),
      eventPlace: $enumDecode(_$FeedEventPlaceEnumMap, json['eventPlace']),
      txType: $enumDecode(_$FeedTxTypeEnumMap, json['txType']),
      txFee: (json['txFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeedEventToJson(FeedEvent instance) => <String, dynamic>{
      'hash': instance.hash,
      'timestamp': instance.timestamp,
      'tx': instance.tx,
      'eventPlace': _$FeedEventPlaceEnumMap[instance.eventPlace]!,
      'txType': _$FeedTxTypeEnumMap[instance.txType]!,
      'txFee': instance.txFee,
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
