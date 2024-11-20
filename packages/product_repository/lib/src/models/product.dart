import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String createdAt;

  const Product(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.createdAt});

  static const empty =
      Product(id: '', userId: '', title: '', description: '', createdAt: '');

  Product copyWith(
      {String? id,
      String? userId,
      String? title,
      String? description,
      String? createdAt}) {
    return Product(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [userId, title, description];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );
  }
}
