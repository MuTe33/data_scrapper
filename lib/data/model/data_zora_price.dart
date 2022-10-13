import 'package:data_scrapper/data/model/data_zora_eth_price.dart';
import 'package:data_scrapper/data/model/data_zora_usdc_price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_price.g.dart';

@JsonSerializable()
class DataZoraPrice {
  DataZoraPrice(
    this.usdcPrice,
    this.ethPrice,
  );

  factory DataZoraPrice.fromJson(Map<String, dynamic> json) =>
      _$DataZoraPriceFromJson(json);

  @JsonKey(name: 'usdcPrice')
  final DataZoraUsdcPrice usdcPrice;

  @JsonKey(name: 'chainTokenPrice')
  final DataZoraEthPrice ethPrice;
}
