import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  @JsonKey(name: 'user_firstname')
  final String firstName;

  @JsonKey(name: 'user_lastname')
  final String lastName;

  @JsonKey(name: 'user_email')
  final String email;

  @JsonKey(name: 'user_id')
  final String userId;

  @JsonKey(name: 'user_username')
  final String username;

  @JsonKey(name: 'user_accountlevel')
  final String accountLevel;

  @JsonKey(name: 'user_city')
  final String city;

  @JsonKey(name: 'user_state')
  final String state;

  @JsonKey(name: 'user_address')
  final String address;

  @JsonKey(name: 'user_company')
  final String company;

  @JsonKey(name: 'user_dateofbirth')
  final String birthday;

  @JsonKey(name: 'user_avatar')
  final String avatar;

  @JsonKey(name: 'chat_key')
  final String chatKey;

  @JsonKey(name: 'chat_room')
  final String chatRoom;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userId,
    required this.username,
    required this.accountLevel,
    required this.city,
    required this.state,
    required this.address,
    required this.company,
    required this.birthday,
    required this.avatar,
    required this.chatKey,
    required this.chatRoom,
  });

  factory User.fromJsonLegacy(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
