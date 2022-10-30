import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_token_media_encoding.g.dart';

@JsonSerializable()
class DataZoraTokenMediaEncoding {
  DataZoraTokenMediaEncoding(this.original);

  factory DataZoraTokenMediaEncoding.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTokenMediaEncodingFromJson(json);

  @JsonKey(name: 'original')
  final String? original;
}
