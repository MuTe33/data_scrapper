// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      json['emoji'] as String,
      json['colorIndex'] as int,
      json['backgroundColorIndex'] as int,
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'emoji': instance.emoji,
      'colorIndex': instance.colorIndex,
      'backgroundColorIndex': instance.backgroundColorIndex,
    };
