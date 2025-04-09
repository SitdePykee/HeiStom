import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
sealed class UserModel with _$UserModel {
  @JsonSerializable()
  factory UserModel({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}