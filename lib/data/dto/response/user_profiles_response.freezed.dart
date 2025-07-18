// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profiles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfilesResponse _$UserProfilesResponseFromJson(Map<String, dynamic> json) {
  return _UserProfilesResponse.fromJson(json);
}

/// @nodoc
mixin _$UserProfilesResponse {
  @JsonKey(name: 'userId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nickname')
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profileImage')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'neighborhood')
  String? get neighborhood => throw _privateConstructorUsedError;
  @JsonKey(name: 'reliability')
  int get reliability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfilesResponseCopyWith<UserProfilesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilesResponseCopyWith<$Res> {
  factory $UserProfilesResponseCopyWith(UserProfilesResponse value,
          $Res Function(UserProfilesResponse) then) =
      _$UserProfilesResponseCopyWithImpl<$Res, UserProfilesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'profileImage') String? profileImage,
      @JsonKey(name: 'neighborhood') String? neighborhood,
      @JsonKey(name: 'reliability') int reliability});
}

/// @nodoc
class _$UserProfilesResponseCopyWithImpl<$Res,
        $Val extends UserProfilesResponse>
    implements $UserProfilesResponseCopyWith<$Res> {
  _$UserProfilesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = freezed,
    Object? profileImage = freezed,
    Object? neighborhood = freezed,
    Object? reliability = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfilesResponseImplCopyWith<$Res>
    implements $UserProfilesResponseCopyWith<$Res> {
  factory _$$UserProfilesResponseImplCopyWith(_$UserProfilesResponseImpl value,
          $Res Function(_$UserProfilesResponseImpl) then) =
      __$$UserProfilesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') int userId,
      @JsonKey(name: 'nickname') String? nickname,
      @JsonKey(name: 'profileImage') String? profileImage,
      @JsonKey(name: 'neighborhood') String? neighborhood,
      @JsonKey(name: 'reliability') int reliability});
}

/// @nodoc
class __$$UserProfilesResponseImplCopyWithImpl<$Res>
    extends _$UserProfilesResponseCopyWithImpl<$Res, _$UserProfilesResponseImpl>
    implements _$$UserProfilesResponseImplCopyWith<$Res> {
  __$$UserProfilesResponseImplCopyWithImpl(_$UserProfilesResponseImpl _value,
      $Res Function(_$UserProfilesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = freezed,
    Object? profileImage = freezed,
    Object? neighborhood = freezed,
    Object? reliability = null,
  }) {
    return _then(_$UserProfilesResponseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: freezed == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String?,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfilesResponseImpl implements _UserProfilesResponse {
  const _$UserProfilesResponseImpl(
      {@JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'nickname') required this.nickname,
      @JsonKey(name: 'profileImage') this.profileImage,
      @JsonKey(name: 'neighborhood') required this.neighborhood,
      @JsonKey(name: 'reliability') required this.reliability});

  factory _$UserProfilesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfilesResponseImplFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final int userId;
  @override
  @JsonKey(name: 'nickname')
  final String? nickname;
  @override
  @JsonKey(name: 'profileImage')
  final String? profileImage;
  @override
  @JsonKey(name: 'neighborhood')
  final String? neighborhood;
  @override
  @JsonKey(name: 'reliability')
  final int reliability;

  @override
  String toString() {
    return 'UserProfilesResponse(userId: $userId, nickname: $nickname, profileImage: $profileImage, neighborhood: $neighborhood, reliability: $reliability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfilesResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.reliability, reliability) ||
                other.reliability == reliability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, nickname, profileImage, neighborhood, reliability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfilesResponseImplCopyWith<_$UserProfilesResponseImpl>
      get copyWith =>
          __$$UserProfilesResponseImplCopyWithImpl<_$UserProfilesResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfilesResponseImplToJson(
      this,
    );
  }
}

abstract class _UserProfilesResponse implements UserProfilesResponse {
  const factory _UserProfilesResponse(
          {@JsonKey(name: 'userId') required final int userId,
          @JsonKey(name: 'nickname') required final String? nickname,
          @JsonKey(name: 'profileImage') final String? profileImage,
          @JsonKey(name: 'neighborhood') required final String? neighborhood,
          @JsonKey(name: 'reliability') required final int reliability}) =
      _$UserProfilesResponseImpl;

  factory _UserProfilesResponse.fromJson(Map<String, dynamic> json) =
      _$UserProfilesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'userId')
  int get userId;
  @override
  @JsonKey(name: 'nickname')
  String? get nickname;
  @override
  @JsonKey(name: 'profileImage')
  String? get profileImage;
  @override
  @JsonKey(name: 'neighborhood')
  String? get neighborhood;
  @override
  @JsonKey(name: 'reliability')
  int get reliability;
  @override
  @JsonKey(ignore: true)
  _$$UserProfilesResponseImplCopyWith<_$UserProfilesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
