import 'dart:convert';

class RedmineUser {
  const RedmineUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.mail,
    required this.avatarUrl,
    required this.apiKey,
  });

  final int id;
  final String firstName;
  final String? lastName;
  final String? mail;
  final String? avatarUrl;
  final String apiKey;

  factory RedmineUser.fromJson(Map<String, dynamic> json) {
    return RedmineUser(
      id: json['id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      mail: json['mail'],
      avatarUrl: json['avatar_url'],
      apiKey: json['api_key'],
    );
  }

  String toJson() {
    final map = <String, dynamic>{
      'id': id,
      'firstname': firstName,
      'lastname': lastName,
      'mail': mail,
      'avatar_url': avatarUrl,
      'api_key': apiKey,
    };

    return jsonEncode(map);
  }
}
