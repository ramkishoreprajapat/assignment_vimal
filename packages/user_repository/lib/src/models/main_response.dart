import 'package:equatable/equatable.dart';

import '../../user_repository.dart';

class MainResponse extends Equatable {
  final ErrorModel errorData;
  final dynamic succcessData;
  final int statusCode;

  const MainResponse(
      {this.succcessData, this.statusCode = 0, required this.errorData});

  @override
  List<Object?> get props => [];

  static const empty = MainResponse(
      errorData: ErrorModel.empty, succcessData: null, statusCode: 0);
  MainResponse copyWith(
      {ErrorModel? errorData, dynamic succcessData, int? statusCode}) {
    return MainResponse(
        errorData: errorData ?? this.errorData,
        succcessData: succcessData ?? this.succcessData,
        statusCode: statusCode ?? this.statusCode);
  }
}
