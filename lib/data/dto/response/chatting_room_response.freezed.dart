// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatting_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChattingRoomResponse _$ChattingRoomResponseFromJson(Map<String, dynamic> json) {
  return _ChattingRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$ChattingRoomResponse {
  int get id => throw _privateConstructorUsedError;
  Partner get partner => throw _privateConstructorUsedError;
  SharePost get sharePost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChattingRoomResponseCopyWith<ChattingRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChattingRoomResponseCopyWith<$Res> {
  factory $ChattingRoomResponseCopyWith(ChattingRoomResponse value,
          $Res Function(ChattingRoomResponse) then) =
      _$ChattingRoomResponseCopyWithImpl<$Res, ChattingRoomResponse>;
  @useResult
  $Res call({int id, Partner partner, SharePost sharePost});

  $PartnerCopyWith<$Res> get partner;
  $SharePostCopyWith<$Res> get sharePost;
}

/// @nodoc
class _$ChattingRoomResponseCopyWithImpl<$Res,
        $Val extends ChattingRoomResponse>
    implements $ChattingRoomResponseCopyWith<$Res> {
  _$ChattingRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partner = null,
    Object? sharePost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partner: null == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as Partner,
      sharePost: null == sharePost
          ? _value.sharePost
          : sharePost // ignore: cast_nullable_to_non_nullable
              as SharePost,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartnerCopyWith<$Res> get partner {
    return $PartnerCopyWith<$Res>(_value.partner, (value) {
      return _then(_value.copyWith(partner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SharePostCopyWith<$Res> get sharePost {
    return $SharePostCopyWith<$Res>(_value.sharePost, (value) {
      return _then(_value.copyWith(sharePost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChattingRoomResponseImplCopyWith<$Res>
    implements $ChattingRoomResponseCopyWith<$Res> {
  factory _$$ChattingRoomResponseImplCopyWith(_$ChattingRoomResponseImpl value,
          $Res Function(_$ChattingRoomResponseImpl) then) =
      __$$ChattingRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Partner partner, SharePost sharePost});

  @override
  $PartnerCopyWith<$Res> get partner;
  @override
  $SharePostCopyWith<$Res> get sharePost;
}

/// @nodoc
class __$$ChattingRoomResponseImplCopyWithImpl<$Res>
    extends _$ChattingRoomResponseCopyWithImpl<$Res, _$ChattingRoomResponseImpl>
    implements _$$ChattingRoomResponseImplCopyWith<$Res> {
  __$$ChattingRoomResponseImplCopyWithImpl(_$ChattingRoomResponseImpl _value,
      $Res Function(_$ChattingRoomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? partner = null,
    Object? sharePost = null,
  }) {
    return _then(_$ChattingRoomResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      partner: null == partner
          ? _value.partner
          : partner // ignore: cast_nullable_to_non_nullable
              as Partner,
      sharePost: null == sharePost
          ? _value.sharePost
          : sharePost // ignore: cast_nullable_to_non_nullable
              as SharePost,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChattingRoomResponseImpl implements _ChattingRoomResponse {
  const _$ChattingRoomResponseImpl(
      {required this.id, required this.partner, required this.sharePost});

  factory _$ChattingRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChattingRoomResponseImplFromJson(json);

  @override
  final int id;
  @override
  final Partner partner;
  @override
  final SharePost sharePost;

  @override
  String toString() {
    return 'ChattingRoomResponse(id: $id, partner: $partner, sharePost: $sharePost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChattingRoomResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partner, partner) || other.partner == partner) &&
            (identical(other.sharePost, sharePost) ||
                other.sharePost == sharePost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, partner, sharePost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChattingRoomResponseImplCopyWith<_$ChattingRoomResponseImpl>
      get copyWith =>
          __$$ChattingRoomResponseImplCopyWithImpl<_$ChattingRoomResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChattingRoomResponseImplToJson(
      this,
    );
  }
}

abstract class _ChattingRoomResponse implements ChattingRoomResponse {
  const factory _ChattingRoomResponse(
      {required final int id,
      required final Partner partner,
      required final SharePost sharePost}) = _$ChattingRoomResponseImpl;

  factory _ChattingRoomResponse.fromJson(Map<String, dynamic> json) =
      _$ChattingRoomResponseImpl.fromJson;

  @override
  int get id;
  @override
  Partner get partner;
  @override
  SharePost get sharePost;
  @override
  @JsonKey(ignore: true)
  _$$ChattingRoomResponseImplCopyWith<_$ChattingRoomResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return _Partner.fromJson(json);
}

/// @nodoc
mixin _$Partner {
  int get userId => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  int get reliability => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartnerCopyWith<Partner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartnerCopyWith<$Res> {
  factory $PartnerCopyWith(Partner value, $Res Function(Partner) then) =
      _$PartnerCopyWithImpl<$Res, Partner>;
  @useResult
  $Res call(
      {int userId,
      String nickname,
      String profileImage,
      String neighborhood,
      int reliability});
}

/// @nodoc
class _$PartnerCopyWithImpl<$Res, $Val extends Partner>
    implements $PartnerCopyWith<$Res> {
  _$PartnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? profileImage = null,
    Object? neighborhood = null,
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
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartnerImplCopyWith<$Res> implements $PartnerCopyWith<$Res> {
  factory _$$PartnerImplCopyWith(
          _$PartnerImpl value, $Res Function(_$PartnerImpl) then) =
      __$$PartnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      String nickname,
      String profileImage,
      String neighborhood,
      int reliability});
}

/// @nodoc
class __$$PartnerImplCopyWithImpl<$Res>
    extends _$PartnerCopyWithImpl<$Res, _$PartnerImpl>
    implements _$$PartnerImplCopyWith<$Res> {
  __$$PartnerImplCopyWithImpl(
      _$PartnerImpl _value, $Res Function(_$PartnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? profileImage = null,
    Object? neighborhood = null,
    Object? reliability = null,
  }) {
    return _then(_$PartnerImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      neighborhood: null == neighborhood
          ? _value.neighborhood
          : neighborhood // ignore: cast_nullable_to_non_nullable
              as String,
      reliability: null == reliability
          ? _value.reliability
          : reliability // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartnerImpl implements _Partner {
  const _$PartnerImpl(
      {required this.userId,
      required this.nickname,
      required this.profileImage,
      required this.neighborhood,
      required this.reliability});

  factory _$PartnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartnerImplFromJson(json);

  @override
  final int userId;
  @override
  final String nickname;
  @override
  final String profileImage;
  @override
  final String neighborhood;
  @override
  final int reliability;

  @override
  String toString() {
    return 'Partner(userId: $userId, nickname: $nickname, profileImage: $profileImage, neighborhood: $neighborhood, reliability: $reliability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartnerImpl &&
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
  _$$PartnerImplCopyWith<_$PartnerImpl> get copyWith =>
      __$$PartnerImplCopyWithImpl<_$PartnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartnerImplToJson(
      this,
    );
  }
}

abstract class _Partner implements Partner {
  const factory _Partner(
      {required final int userId,
      required final String nickname,
      required final String profileImage,
      required final String neighborhood,
      required final int reliability}) = _$PartnerImpl;

  factory _Partner.fromJson(Map<String, dynamic> json) = _$PartnerImpl.fromJson;

  @override
  int get userId;
  @override
  String get nickname;
  @override
  String get profileImage;
  @override
  String get neighborhood;
  @override
  int get reliability;
  @override
  @JsonKey(ignore: true)
  _$$PartnerImplCopyWith<_$PartnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SharePost _$SharePostFromJson(Map<String, dynamic> json) {
  return _SharePost.fromJson(json);
}

/// @nodoc
mixin _$SharePost {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;
  int get hits => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isBid => throw _privateConstructorUsedError;
  Partner get userProfileResponse => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharePostCopyWith<SharePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharePostCopyWith<$Res> {
  factory $SharePostCopyWith(SharePost value, $Res Function(SharePost) then) =
      _$SharePostCopyWithImpl<$Res, SharePost>;
  @useResult
  $Res call(
      {int id,
      String title,
      String category,
      String content,
      List<String> images,
      String type,
      String description,
      String location,
      bool isSold,
      int hits,
      DateTime createdAt,
      DateTime updatedAt,
      int likeCount,
      bool isLiked,
      bool isBid,
      Partner userProfileResponse});

  $PartnerCopyWith<$Res> get userProfileResponse;
}

/// @nodoc
class _$SharePostCopyWithImpl<$Res, $Val extends SharePost>
    implements $SharePostCopyWith<$Res> {
  _$SharePostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? content = null,
    Object? images = null,
    Object? type = null,
    Object? description = null,
    Object? location = null,
    Object? isSold = null,
    Object? hits = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? likeCount = null,
    Object? isLiked = null,
    Object? isBid = null,
    Object? userProfileResponse = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isBid: null == isBid
          ? _value.isBid
          : isBid // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileResponse: null == userProfileResponse
          ? _value.userProfileResponse
          : userProfileResponse // ignore: cast_nullable_to_non_nullable
              as Partner,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PartnerCopyWith<$Res> get userProfileResponse {
    return $PartnerCopyWith<$Res>(_value.userProfileResponse, (value) {
      return _then(_value.copyWith(userProfileResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SharePostImplCopyWith<$Res>
    implements $SharePostCopyWith<$Res> {
  factory _$$SharePostImplCopyWith(
          _$SharePostImpl value, $Res Function(_$SharePostImpl) then) =
      __$$SharePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String category,
      String content,
      List<String> images,
      String type,
      String description,
      String location,
      bool isSold,
      int hits,
      DateTime createdAt,
      DateTime updatedAt,
      int likeCount,
      bool isLiked,
      bool isBid,
      Partner userProfileResponse});

  @override
  $PartnerCopyWith<$Res> get userProfileResponse;
}

/// @nodoc
class __$$SharePostImplCopyWithImpl<$Res>
    extends _$SharePostCopyWithImpl<$Res, _$SharePostImpl>
    implements _$$SharePostImplCopyWith<$Res> {
  __$$SharePostImplCopyWithImpl(
      _$SharePostImpl _value, $Res Function(_$SharePostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? category = null,
    Object? content = null,
    Object? images = null,
    Object? type = null,
    Object? description = null,
    Object? location = null,
    Object? isSold = null,
    Object? hits = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? likeCount = null,
    Object? isLiked = null,
    Object? isBid = null,
    Object? userProfileResponse = null,
  }) {
    return _then(_$SharePostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isBid: null == isBid
          ? _value.isBid
          : isBid // ignore: cast_nullable_to_non_nullable
              as bool,
      userProfileResponse: null == userProfileResponse
          ? _value.userProfileResponse
          : userProfileResponse // ignore: cast_nullable_to_non_nullable
              as Partner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SharePostImpl implements _SharePost {
  const _$SharePostImpl(
      {required this.id,
      required this.title,
      required this.category,
      required this.content,
      required final List<String> images,
      required this.type,
      required this.description,
      required this.location,
      required this.isSold,
      required this.hits,
      required this.createdAt,
      required this.updatedAt,
      required this.likeCount,
      required this.isLiked,
      required this.isBid,
      required this.userProfileResponse})
      : _images = images;

  factory _$SharePostImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharePostImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String category;
  @override
  final String content;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String type;
  @override
  final String description;
  @override
  final String location;
  @override
  final bool isSold;
  @override
  final int hits;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int likeCount;
  @override
  final bool isLiked;
  @override
  final bool isBid;
  @override
  final Partner userProfileResponse;

  @override
  String toString() {
    return 'SharePost(id: $id, title: $title, category: $category, content: $content, images: $images, type: $type, description: $description, location: $location, isSold: $isSold, hits: $hits, createdAt: $createdAt, updatedAt: $updatedAt, likeCount: $likeCount, isLiked: $isLiked, isBid: $isBid, userProfileResponse: $userProfileResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharePostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isSold, isSold) || other.isSold == isSold) &&
            (identical(other.hits, hits) || other.hits == hits) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.isBid, isBid) || other.isBid == isBid) &&
            (identical(other.userProfileResponse, userProfileResponse) ||
                other.userProfileResponse == userProfileResponse));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      category,
      content,
      const DeepCollectionEquality().hash(_images),
      type,
      description,
      location,
      isSold,
      hits,
      createdAt,
      updatedAt,
      likeCount,
      isLiked,
      isBid,
      userProfileResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SharePostImplCopyWith<_$SharePostImpl> get copyWith =>
      __$$SharePostImplCopyWithImpl<_$SharePostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharePostImplToJson(
      this,
    );
  }
}

abstract class _SharePost implements SharePost {
  const factory _SharePost(
      {required final int id,
      required final String title,
      required final String category,
      required final String content,
      required final List<String> images,
      required final String type,
      required final String description,
      required final String location,
      required final bool isSold,
      required final int hits,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final int likeCount,
      required final bool isLiked,
      required final bool isBid,
      required final Partner userProfileResponse}) = _$SharePostImpl;

  factory _SharePost.fromJson(Map<String, dynamic> json) =
      _$SharePostImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get category;
  @override
  String get content;
  @override
  List<String> get images;
  @override
  String get type;
  @override
  String get description;
  @override
  String get location;
  @override
  bool get isSold;
  @override
  int get hits;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get likeCount;
  @override
  bool get isLiked;
  @override
  bool get isBid;
  @override
  Partner get userProfileResponse;
  @override
  @JsonKey(ignore: true)
  _$$SharePostImplCopyWith<_$SharePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
