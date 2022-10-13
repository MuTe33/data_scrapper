// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraPrice _$DataZoraPriceFromJson(Map<String, dynamic> json) =>
    DataZoraPrice(
      DataZoraUsdcPrice.fromJson(json['usdcPrice'] as Map<String, dynamic>),
      DataZoraEthPrice.fromJson(
          json['chainTokenPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataZoraPriceToJson(DataZoraPrice instance) =>
    <String, dynamic>{
      'usdcPrice': instance.usdcPrice,
      'chainTokenPrice': instance.ethPrice,
    };
