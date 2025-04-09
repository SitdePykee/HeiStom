import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

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
    String? address,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
        phone: phone,
        avatar: avatar,
        address: address,
      );
}
