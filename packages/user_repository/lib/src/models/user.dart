import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String accessToken;

  const User({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accessToken: json['access_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
