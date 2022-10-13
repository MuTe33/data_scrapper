import 'package:data_scrapper/data/model/data_zora_token_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_token.g.dart';

@JsonSerializable()
class DataZoraToken {
  DataZoraToken(
    this.collectionAddress,
    this.collectionName,
    this.tokenId,
    this.name,
    this.image,
  );

  factory DataZoraToken.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTokenFromJson(json);

  @JsonKey(name: 'collectionAddress')
  final String collectionAddress;

  @JsonKey(name: 'collectionName')
  final String? collectionName;

  @JsonKey(name: 'tokenId')
  final String tokenId;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'image')
  final DataZoraTokenImage? image;
}
