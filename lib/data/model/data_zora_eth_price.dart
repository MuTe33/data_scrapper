import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_eth_price.g.dart';

@JsonSerializable()
class DataZoraEthPrice {
  DataZoraEthPrice(
    this.decimal,
  );

  factory DataZoraEthPrice.fromJson(Map<String, dynamic> json) =>
      _$DataZoraEthPriceFromJson(json);

  @JsonKey(name: 'decimal')
  final double decimal;
}
