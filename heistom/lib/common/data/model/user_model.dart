import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heistom/common/domain/entity/user_entity.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
sealed class UserModel with _$UserModel {
  @JsonSerializable()
  factory UserModel({
    String? uuid,
    String? name,
    String? email,
    String? phoneNumber,
    String? avatar,
    String? address,
    String? type
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  UserEntity toEntity() => UserEntity(
        id: uuid,
        name: name,
        email: email,
        phone: phoneNumber,
        avatar: avatar,
        address: address,
        role: type
      );
}
