import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.g.dart';
part 'notification_model.freezed.dart';

@freezed
sealed class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    String? id,
    String? title,
    String? content,
    bool? hasRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
