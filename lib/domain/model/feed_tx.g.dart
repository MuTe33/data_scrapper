// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_tx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedTx _$FeedTxFromJson(Map<String, dynamic> json) => FeedTx(
      mainAddress: json['mainAddress'] as String,
      secondaryAddress: json['secondaryAddress'] as String,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => FeedToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainEns: json['mainEns'] as String?,
      secondaryEns: json['secondaryEns'] as String?,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedTxToJson(FeedTx instance) => <String, dynamic>{
      'mainAddress': instance.mainAddress,
      'secondaryAddress': instance.secondaryAddress,
      'tokens': instance.tokens,
      'mainEns': instance.mainEns,
      'secondaryEns': instance.secondaryEns,
      'avatar': instance.avatar,
    };
