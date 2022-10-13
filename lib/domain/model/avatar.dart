import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable()
class Avatar {
  Avatar(
    this.emoji,
    this.colorIndex,
    this.backgroundColorIndex,
  );

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  Map<String, dynamic> toJson() => _$AvatarToJson(this);

  final String emoji;
  final int colorIndex;
  final int backgroundColorIndex;
}
