import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String type;
  final String price;
  final bool favourite;

  const Product(
      {required this.id,
      required this.name,
      required this.type,
      required this.price,
      required this.favourite});

  static const empty =
      Product(id: 0, name: '', type: '', price: '', favourite: false);

  Product copyWith(
      {int? id, String? name, String? type, String? price, bool? favourite}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      favourite: favourite ?? this.favourite,
    );
  }

  @override
  List<Object?> get props => [name, type, price];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      price: json['price'] as String,
      favourite: json['favourite'] as bool,
    );
  }
}
