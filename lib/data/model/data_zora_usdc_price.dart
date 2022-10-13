import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_usdc_price.g.dart';

@JsonSerializable()
class DataZoraUsdcPrice {
  DataZoraUsdcPrice(
    this.decimal,
  );

  factory DataZoraUsdcPrice.fromJson(Map<String, dynamic> json) =>
      _$DataZoraUsdcPriceFromJson(json);

  @JsonKey(name: 'decimal')
  final double decimal;
}
