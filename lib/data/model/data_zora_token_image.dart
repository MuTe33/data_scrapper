import 'package:data_scrapper/data/model/data_zora_token_media_encoding.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_token_image.g.dart';

@JsonSerializable()
class DataZoraTokenImage {
  DataZoraTokenImage(
    this.url,
    this.mediaEncoding,
  );

  factory DataZoraTokenImage.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTokenImageFromJson(json);

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'mediaEncoding')
  final DataZoraTokenMediaEncoding? mediaEncoding;
}
