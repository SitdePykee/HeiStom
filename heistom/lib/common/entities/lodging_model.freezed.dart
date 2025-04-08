// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lodging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LodgingModel {
  String? get id;
  String? get name;
  String? get address;
  double? get pricePerDay;
  double? get pricePerMonth;
  double? get acreage;
  String? get image;
  String? get description;
  int? get views;
  List<String>? get amenities;
  String? get ownerID;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LodgingModelCopyWith<LodgingModel> get copyWith =>
      _$LodgingModelCopyWithImpl<LodgingModel>(
          this as LodgingModel, _$identity);

  /// Serializes this LodgingModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LodgingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pricePerDay, pricePerDay) ||
                other.pricePerDay == pricePerDay) &&
            (identical(other.pricePerMonth, pricePerMonth) ||
                other.pricePerMonth == pricePerMonth) &&
            (identical(other.acreage, acreage) || other.acreage == acreage) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.views, views) || other.views == views) &&
            const DeepCollectionEquality().equals(other.amenities, amenities) &&
            (identical(other.ownerID, ownerID) || other.ownerID == ownerID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      pricePerDay,
      pricePerMonth,
      acreage,
      image,
      description,
      views,
      const DeepCollectionEquality().hash(amenities),
      ownerID);

  @override
  String toString() {
    return 'LodgingModel(id: $id, name: $name, address: $address, pricePerDay: $pricePerDay, pricePerMonth: $pricePerMonth, acreage: $acreage, image: $image, description: $description, views: $views, amenities: $amenities, ownerID: $ownerID)';
  }
}

/// @nodoc
abstract mixin class $LodgingModelCopyWith<$Res> {
  factory $LodgingModelCopyWith(
          LodgingModel value, $Res Function(LodgingModel) _then) =
      _$LodgingModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      double? pricePerDay,
      double? pricePerMonth,
      double? acreage,
      String? image,
      String? description,
      int? views,
      List<String>? amenities,
      String? ownerID});
}

/// @nodoc
class _$LodgingModelCopyWithImpl<$Res> implements $LodgingModelCopyWith<$Res> {
  _$LodgingModelCopyWithImpl(this._self, this._then);

  final LodgingModel _self;
  final $Res Function(LodgingModel) _then;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? pricePerDay = freezed,
    Object? pricePerMonth = freezed,
    Object? acreage = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? views = freezed,
    Object? amenities = freezed,
    Object? ownerID = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerDay: freezed == pricePerDay
          ? _self.pricePerDay
          : pricePerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      pricePerMonth: freezed == pricePerMonth
          ? _self.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as double?,
      acreage: freezed == acreage
          ? _self.acreage
          : acreage // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      amenities: freezed == amenities
          ? _self.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ownerID: freezed == ownerID
          ? _self.ownerID
          : ownerID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LodgingModel implements LodgingModel {
  _LodgingModel(
      {this.id,
      this.name,
      this.address,
      this.pricePerDay,
      this.pricePerMonth,
      this.acreage,
      this.image,
      this.description,
      this.views,
      final List<String>? amenities,
      this.ownerID})
      : _amenities = amenities;
  factory _LodgingModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final double? pricePerDay;
  @override
  final double? pricePerMonth;
  @override
  final double? acreage;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final int? views;
  final List<String>? _amenities;
  @override
  List<String>? get amenities {
    final value = _amenities;
    if (value == null) return null;
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? ownerID;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LodgingModelCopyWith<_LodgingModel> get copyWith =>
      __$LodgingModelCopyWithImpl<_LodgingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LodgingModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LodgingModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pricePerDay, pricePerDay) ||
                other.pricePerDay == pricePerDay) &&
            (identical(other.pricePerMonth, pricePerMonth) ||
                other.pricePerMonth == pricePerMonth) &&
            (identical(other.acreage, acreage) || other.acreage == acreage) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.views, views) || other.views == views) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.ownerID, ownerID) || other.ownerID == ownerID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      pricePerDay,
      pricePerMonth,
      acreage,
      image,
      description,
      views,
      const DeepCollectionEquality().hash(_amenities),
      ownerID);

  @override
  String toString() {
    return 'LodgingModel(id: $id, name: $name, address: $address, pricePerDay: $pricePerDay, pricePerMonth: $pricePerMonth, acreage: $acreage, image: $image, description: $description, views: $views, amenities: $amenities, ownerID: $ownerID)';
  }
}

/// @nodoc
abstract mixin class _$LodgingModelCopyWith<$Res>
    implements $LodgingModelCopyWith<$Res> {
  factory _$LodgingModelCopyWith(
          _LodgingModel value, $Res Function(_LodgingModel) _then) =
      __$LodgingModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      double? pricePerDay,
      double? pricePerMonth,
      double? acreage,
      String? image,
      String? description,
      int? views,
      List<String>? amenities,
      String? ownerID});
}

/// @nodoc
class __$LodgingModelCopyWithImpl<$Res>
    implements _$LodgingModelCopyWith<$Res> {
  __$LodgingModelCopyWithImpl(this._self, this._then);

  final _LodgingModel _self;
  final $Res Function(_LodgingModel) _then;

  /// Create a copy of LodgingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? pricePerDay = freezed,
    Object? pricePerMonth = freezed,
    Object? acreage = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? views = freezed,
    Object? amenities = freezed,
    Object? ownerID = freezed,
  }) {
    return _then(_LodgingModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      pricePerDay: freezed == pricePerDay
          ? _self.pricePerDay
          : pricePerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      pricePerMonth: freezed == pricePerMonth
          ? _self.pricePerMonth
          : pricePerMonth // ignore: cast_nullable_to_non_nullable
              as double?,
      acreage: freezed == acreage
          ? _self.acreage
          : acreage // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      amenities: freezed == amenities
          ? _self._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ownerID: freezed == ownerID
          ? _self.ownerID
          : ownerID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
