// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_tx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedTx _$FeedTxFromJson(Map<String, dynamic> json) => FeedTx(
      mainAddress: json['main_address'] as String,
      secondaryAddress: json['secondary_address'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => FeedToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainEns: json['main_ens'] as String?,
      secondaryEns: json['secondary_ens'] as String?,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedTxToJson(FeedTx instance) => <String, dynamic>{
      'main_address': instance.mainAddress,
      'secondary_address': instance.secondaryAddress,
      'tokens': instance.tokens,
      'main_ens': instance.mainEns,
      'secondary_ens': instance.secondaryEns,
      'avatar': instance.avatar,
    };
