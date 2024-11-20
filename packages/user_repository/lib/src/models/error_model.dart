// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String error;
  final String errorDescription;

  const ErrorModel(
      {required this.error,
      required this.errorDescription});

  @override
  List<Object?> get props => [error, errorDescription];

  static const empty =
      ErrorModel(error: '', errorDescription: '');

  ErrorModel copyWith(
      {String? error, String? errorDescription}) {
    return ErrorModel(
        error: error ?? this.error,
        errorDescription: errorDescription ?? this.errorDescription);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'error_escription': errorDescription,
    };
  }

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: json['error'] as String,
      errorDescription: json['error_description'] as String,
    );
  }

  String toJson() => json.encode(toMap());  
}
