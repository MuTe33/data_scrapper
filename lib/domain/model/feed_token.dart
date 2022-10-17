import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_token.g.dart';

@JsonSerializable()
class FeedToken {
  FeedToken({
    required this.contractAddress,
    required this.collectionName,
    required this.tokenId,
    this.name,
    this.imageUrl,
    this.ethPrice,
    this.fiatPrice,
  });

  factory FeedToken.fromJson(Map<String, dynamic> json) =>
      _$FeedTokenFromJson(json);

  Map<String, dynamic> toJson() => _$FeedTokenToJson(this);

  @JsonKey(name: 'contract_address')
  final String contractAddress;

  @JsonKey(name: 'collection_name')
  final String collectionName;

  @JsonKey(name: 'token_id')
  final String tokenId;

  final String? name;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'eth_price')
  final double? ethPrice;

  @JsonKey(name: 'fiat_price')
  final double? fiatPrice;
}
