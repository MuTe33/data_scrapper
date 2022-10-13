import 'package:data_scrapper/data/model/data_zora_price.dart';
import 'package:data_scrapper/data/model/data_zora_transaction_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_sale.g.dart';

@JsonSerializable()
class DataZoraSale {
  DataZoraSale(
    this.txInfo,
    this.price,
    this.saleType,
    this.buyerAddress,
    this.sellerAddress,
  );

  factory DataZoraSale.fromJson(Map<String, dynamic> json) =>
      _$DataZoraSaleFromJson(json);

  @JsonKey(name: 'transactionInfo')
  final DataZoraTransactionInfo txInfo;

  @JsonKey(name: 'price')
  final DataZoraPrice price;

  @JsonKey(name: 'saleType')
  final String saleType;

  @JsonKey(name: 'buyerAddress')
  final String buyerAddress;

  @JsonKey(name: 'sellerAddress')
  final String sellerAddress;
}
