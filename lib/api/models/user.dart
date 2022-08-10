class User {
  final String firstName;
  final String lastName;
  final String email;
  final String userId;
  final String username;
  final String accountLevel;
  final String city;
  final String state;
  final String address;
  final String company;
  final String birthday;
  final String avatar;
  final String chatKey;
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
    required this.chatRoom
  });

  factory User.fromJsonLegacy(Map<String, dynamic> json) {
    return User(
      firstName: json['user_firstname'],
      lastName: json['user_lastname'],
      email: json['user_email'],
      userId: json['user_id'],
      username: json['user_username'],
      accountLevel: json['user_accountlevel'],
      city: json['user_city'],
      state: json['user_state'],
      address: json['user_address'],
      company: json['user_company'],
      birthday: json['user_dateofbirth'],
      avatar: json['user_avatar'],
      chatKey: json['chat_key'],
      chatRoom: json['chat_room'],
    );
  }
}
