import 'package:data_scrapper/data/model/data_zora_sale.dart';
import 'package:data_scrapper/data/model/data_zora_token.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_top_sale.g.dart';

@JsonSerializable()
class DataZoraTopSale {
  DataZoraTopSale(
    this.sale,
    this.token,
  );

  factory DataZoraTopSale.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTopSaleFromJson(json);

  @JsonKey(name: 'sale')
  final DataZoraSale sale;

  @JsonKey(name: 'token')
  final DataZoraToken? token;
}
