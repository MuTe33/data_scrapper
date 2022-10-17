import 'package:data_scrapper/domain/model/feed_event_place.dart';
import 'package:data_scrapper/domain/model/feed_tx.dart';
import 'package:data_scrapper/domain/model/feed_tx_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_event.g.dart';

@JsonSerializable()
class FeedEvent {
  FeedEvent({
    required this.hash,
    required this.timestamp,
    required this.tx,
    required this.eventPlace,
    required this.txType,
    required this.txFee,
  });

  factory FeedEvent.fromJson(Map<String, dynamic> json) =>
      _$FeedEventFromJson(json);

  Map<String, dynamic> toJson() => _$FeedEventToJson(this);

  @JsonKey(name: 'transaction_hash')
  final String hash;

  final String timestamp;

  @JsonKey(name: 'transaction')
  final FeedTx tx;

  @JsonKey(name: 'event_place')
  final FeedEventPlace eventPlace;

  @JsonKey(name: 'transaction_type')
  final FeedTxType txType;

  @JsonKey(name: 'transaction_fee')
  final double? txFee;
}
