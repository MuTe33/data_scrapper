// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedToken _$FeedTokenFromJson(Map<String, dynamic> json) => FeedToken(
      contractAddress: json['contract_address'] as String,
      tokenId: json['token_id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      ethPrice: (json['eth_price'] as num?)?.toDouble(),
      fiatPrice: (json['fiat_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FeedTokenToJson(FeedToken instance) => <String, dynamic>{
      'contract_address': instance.contractAddress,
      'token_id': instance.tokenId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'eth_price': instance.ethPrice,
      'fiat_price': instance.fiatPrice,
    };
