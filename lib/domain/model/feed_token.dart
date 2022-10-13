import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_token.g.dart';

@JsonSerializable()
class FeedToken {
  FeedToken({
    required this.collectionAddress,
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

  final String collectionAddress;
  final String collectionName;
  final String tokenId;
  final String? name;
  final String? imageUrl;
  final double? ethPrice;
  final double? fiatPrice;
}
