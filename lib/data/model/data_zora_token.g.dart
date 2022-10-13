// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraToken _$DataZoraTokenFromJson(Map<String, dynamic> json) =>
    DataZoraToken(
      json['collectionAddress'] as String,
      json['collectionName'] as String?,
      json['tokenId'] as String,
      json['name'] as String?,
      json['image'] == null
          ? null
          : DataZoraTokenImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataZoraTokenToJson(DataZoraToken instance) =>
    <String, dynamic>{
      'collectionAddress': instance.collectionAddress,
      'collectionName': instance.collectionName,
      'tokenId': instance.tokenId,
      'name': instance.name,
      'image': instance.image,
    };
