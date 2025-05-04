// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bid_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BidResponse _$BidResponseFromJson(Map<String, dynamic> json) {
  return _BidResponse.fromJson(json);
}

/// @nodoc
mixin _$BidResponse {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get donation => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  UserInfo get user => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidResponseCopyWith<BidResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidResponseCopyWith<$Res> {
  factory $BidResponseCopyWith(
          BidResponse value, $Res Function(BidResponse) then) =
      _$BidResponseCopyWithImpl<$Res, BidResponse>;
  @useResult
  $Res call(
      {int id,
      String content,
      int donation,
      bool? isSelected,
      UserInfo user,
      DateTime createdAt,
      DateTime updatedAt});

  $UserInfoCopyWith<$Res> get user;
}

/// @nodoc
class _$BidResponseCopyWithImpl<$Res, $Val extends BidResponse>
    implements $BidResponseCopyWith<$Res> {
  _$BidResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? donation = null,
    Object? isSelected = freezed,
    Object? user = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      donation: null == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get user {
    return $UserInfoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BidResponseImplCopyWith<$Res>
    implements $BidResponseCopyWith<$Res> {
  factory _$$BidResponseImplCopyWith(
          _$BidResponseImpl value, $Res Function(_$BidResponseImpl) then) =
      __$$BidResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      int donation,
      bool? isSelected,
      UserInfo user,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $UserInfoCopyWith<$Res> get user;
}

/// @nodoc
class __$$BidResponseImplCopyWithImpl<$Res>
    extends _$BidResponseCopyWithImpl<$Res, _$BidResponseImpl>
    implements _$$BidResponseImplCopyWith<$Res> {
  __$$BidResponseImplCopyWithImpl(
      _$BidResponseImpl _value, $Res Function(_$BidResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? donation = null,
    Object? isSelected = freezed,
    Object? user = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BidResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      donation: null == donation
          ? _value.donation
          : donation // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BidResponseImpl implements _BidResponse {
  const _$BidResponseImpl(
      {required this.id,
      required this.content,
      required this.donation,
      this.isSelected,
      required this.user,
      required this.createdAt,
      required this.updatedAt});

  factory _$BidResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BidResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  final int donation;
  @override
  final bool? isSelected;
  @override
  final UserInfo user;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BidResponse(id: $id, content: $content, donation: $donation, isSelected: $isSelected, user: $user, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BidResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.donation, donation) ||
                other.donation == donation) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, donation,
      isSelected, user, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BidResponseImplCopyWith<_$BidResponseImpl> get copyWith =>
      __$$BidResponseImplCopyWithImpl<_$BidResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BidResponseImplToJson(
      this,
    );
  }
}

abstract class _BidResponse implements BidResponse {
  const factory _BidResponse(
      {required final int id,
      required final String content,
      required final int donation,
      final bool? isSelected,
      required final UserInfo user,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BidResponseImpl;

  factory _BidResponse.fromJson(Map<String, dynamic> json) =
      _$BidResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  int get donation;
  @override
  bool? get isSelected;
  @override
  UserInfo get user;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BidResponseImplCopyWith<_$BidResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  int get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  List<dynamic> get shareCategories => throw _privateConstructorUsedError;
  int get reliability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {int userId,
      String nickname,
      String email,
      String? profileImage,
      String gender,
      String? birthDate,
      String neighborhood,
      List<dynamic> shareCategories,
      int reliability});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? email = null,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? neighborhood = null,
    Object? shareCategories = null,
    Object? reliability = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      shareCategories: null == shareCategories
          ? _value.shareCategories
          : shareCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      String nickname,
      String email,
      String? profileImage,
      String gender,
      String? birthDate,
      String neighborhood,
      List<dynamic> shareCategories,
      int reliability});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? email = null,
    Object? profileImage = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? neighborhood = null,
    Object? shareCategories = null,
    Object? reliability = null,
  }) {
    return _then(_$UserInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      shareCategories: null == shareCategories
          ? _value._shareCategories
          : shareCategories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {required this.userId,
      required this.nickname,
      required this.email,
      this.profileImage,
      required this.gender,
      this.birthDate,
      required this.neighborhood,
      required final List<dynamic> shareCategories,
      required this.reliability})
      : _shareCategories = shareCategories;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final int userId;
  @override
  final String nickname;
  @override
  final String email;
  @override
  final String? profileImage;
  @override
  final String gender;
  @override
  final String? birthDate;
  @override
  final String neighborhood;
  final List<dynamic> _shareCategories;
  @override
  List<dynamic> get shareCategories {
    if (_shareCategories is EqualUnmodifiableListView) return _shareCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shareCategories);
  }

  @override
  final int reliability;

  @override
  String toString() {
    return 'UserInfo(userId: $userId, nickname: $nickname, email: $email, profileImage: $profileImage, gender: $gender, birthDate: $birthDate, neighborhood: $neighborhood, shareCategories: $shareCategories, reliability: $reliability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            const DeepCollectionEquality()
                .equals(other._shareCategories, _shareCategories) &&
            (identical(other.reliability, reliability) ||
                other.reliability == reliability));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      nickname,
      email,
      profileImage,
      gender,
      birthDate,
      neighborhood,
      const DeepCollectionEquality().hash(_shareCategories),
      reliability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final int userId,
      required final String nickname,
      required final String email,
      final String? profileImage,
      required final String gender,
      final String? birthDate,
      required final String neighborhood,
      required final List<dynamic> shareCategories,
      required final int reliability}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  int get userId;
  @override
  String get nickname;
  @override
  String get email;
  @override
  String? get profileImage;
  @override
  String get gender;
  @override
  String? get birthDate;
  @override
  String get neighborhood;
  @override
  List<dynamic> get shareCategories;
  @override
  int get reliability;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
