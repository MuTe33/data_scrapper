// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_token_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraTokenImage _$DataZoraTokenImageFromJson(Map<String, dynamic> json) =>
    DataZoraTokenImage(
      json['url'] as String?,
      json['mediaEncoding'] == null
          ? null
          : DataZoraTokenMediaEncoding.fromJson(
              json['mediaEncoding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataZoraTokenImageToJson(DataZoraTokenImage instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mediaEncoding': instance.mediaEncoding,
    };
