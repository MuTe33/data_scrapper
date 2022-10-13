// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraSale _$DataZoraSaleFromJson(Map<String, dynamic> json) => DataZoraSale(
      DataZoraTransactionInfo.fromJson(
          json['transactionInfo'] as Map<String, dynamic>),
      DataZoraPrice.fromJson(json['price'] as Map<String, dynamic>),
      json['saleType'] as String,
      json['buyerAddress'] as String,
      json['sellerAddress'] as String,
    );

Map<String, dynamic> _$DataZoraSaleToJson(DataZoraSale instance) =>
    <String, dynamic>{
      'transactionInfo': instance.txInfo,
      'price': instance.price,
      'saleType': instance.saleType,
      'buyerAddress': instance.buyerAddress,
      'sellerAddress': instance.sellerAddress,
    };
