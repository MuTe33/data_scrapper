// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_top_sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraTopSale _$DataZoraTopSaleFromJson(Map<String, dynamic> json) =>
    DataZoraTopSale(
      DataZoraSale.fromJson(json['sale'] as Map<String, dynamic>),
      DataZoraToken.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataZoraTopSaleToJson(DataZoraTopSale instance) =>
    <String, dynamic>{
      'sale': instance.sale,
      'token': instance.token,
    };
