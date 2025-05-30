// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewModel {
  UserModel? get reviewer;
  String? get lodgingID;
  double? get rating;
  String? get comment;
  num? get postAt;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);

  /// Serializes this ReviewModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewModel &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer) &&
            (identical(other.lodgingID, lodgingID) ||
                other.lodgingID == lodgingID) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.postAt, postAt) || other.postAt == postAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reviewer, lodgingID, rating, comment, postAt);

  @override
  String toString() {
    return 'ReviewModel(reviewer: $reviewer, lodgingID: $lodgingID, rating: $rating, comment: $comment, postAt: $postAt)';
  }
}

/// @nodoc
abstract mixin class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) _then) =
      _$ReviewModelCopyWithImpl;
  @useResult
  $Res call(
      {UserModel? reviewer,
      String? lodgingID,
      double? rating,
      String? comment,
      num? postAt});

  $UserModelCopyWith<$Res>? get reviewer;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);

  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewer = freezed,
    Object? lodgingID = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? postAt = freezed,
  }) {
    return _then(_self.copyWith(
      reviewer: freezed == reviewer
          ? _self.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      lodgingID: freezed == lodgingID
          ? _self.lodgingID
          : lodgingID // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      postAt: freezed == postAt
          ? _self.postAt
          : postAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.reviewer!, (value) {
      return _then(_self.copyWith(reviewer: value));
    });
  }
}

/// @nodoc

@JsonSerializable()
class _ReviewModel implements ReviewModel {
  _ReviewModel(
      {this.reviewer, this.lodgingID, this.rating, this.comment, this.postAt});
  factory _ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  @override
  final UserModel? reviewer;
  @override
  final String? lodgingID;
  @override
  final double? rating;
  @override
  final String? comment;
  @override
  final num? postAt;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewModelCopyWith<_ReviewModel> get copyWith =>
      __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewModel &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer) &&
            (identical(other.lodgingID, lodgingID) ||
                other.lodgingID == lodgingID) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.postAt, postAt) || other.postAt == postAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reviewer, lodgingID, rating, comment, postAt);

  @override
  String toString() {
    return 'ReviewModel(reviewer: $reviewer, lodgingID: $lodgingID, rating: $rating, comment: $comment, postAt: $postAt)';
  }
}

/// @nodoc
abstract mixin class _$ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(
          _ReviewModel value, $Res Function(_ReviewModel) _then) =
      __$ReviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserModel? reviewer,
      String? lodgingID,
      double? rating,
      String? comment,
      num? postAt});

  @override
  $UserModelCopyWith<$Res>? get reviewer;
}

/// @nodoc
class __$ReviewModelCopyWithImpl<$Res> implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);

  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviewer = freezed,
    Object? lodgingID = freezed,
    Object? rating = freezed,
    Object? comment = freezed,
    Object? postAt = freezed,
  }) {
    return _then(_ReviewModel(
      reviewer: freezed == reviewer
          ? _self.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      lodgingID: freezed == lodgingID
          ? _self.lodgingID
          : lodgingID // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      postAt: freezed == postAt
          ? _self.postAt
          : postAt // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }

  /// Create a copy of ReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.reviewer!, (value) {
      return _then(_self.copyWith(reviewer: value));
    });
  }
}

// dart format on
