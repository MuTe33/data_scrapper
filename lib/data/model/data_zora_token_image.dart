import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_token_image.g.dart';

@JsonSerializable()
class DataZoraTokenImage {
  DataZoraTokenImage(this.url);

  factory DataZoraTokenImage.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTokenImageFromJson(json);

  @JsonKey(name: 'url')
  final String url;
}
