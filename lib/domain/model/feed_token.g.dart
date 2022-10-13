// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedToken _$FeedTokenFromJson(Map<String, dynamic> json) => FeedToken(
      collectionAddress: json['collectionAddress'] as String,
      collectionName: json['collectionName'] as String,
      tokenId: json['tokenId'] as String,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      ethPrice: (json['ethPrice'] as num?)?.toDouble(),
      fiatPrice: (json['fiatPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeedTokenToJson(FeedToken instance) => <String, dynamic>{
      'collectionAddress': instance.collectionAddress,
      'collectionName': instance.collectionName,
      'tokenId': instance.tokenId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'ethPrice': instance.ethPrice,
      'fiatPrice': instance.fiatPrice,
    };
