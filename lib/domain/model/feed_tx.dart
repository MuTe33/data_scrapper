import 'package:data_scrapper/domain/model/avatar.dart';
import 'package:data_scrapper/domain/model/feed_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_tx.g.dart';

@JsonSerializable()
class FeedTx {
  FeedTx({
    required this.mainAddress,
    required this.secondaryAddress,
    required this.tokens,
    this.mainEns,
    this.secondaryEns,
    this.avatar,
  });

  factory FeedTx.fromJson(Map<String, dynamic> json) => _$FeedTxFromJson(json);

  Map<String, dynamic> toJson() => _$FeedTxToJson(this);

  final String mainAddress;
  final String secondaryAddress;
  final List<FeedToken> tokens;
  final String? mainEns;
  final String? secondaryEns;
  final Avatar? avatar;
}
