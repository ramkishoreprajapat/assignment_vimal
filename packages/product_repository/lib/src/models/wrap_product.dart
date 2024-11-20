import 'package:equatable/equatable.dart';

import '../../product_repository.dart';

class WrapProduct extends Equatable {
  final Product node;

  const WrapProduct({
    required this.node,
  });

  static const empty = WrapProduct(node: Product.empty);

  WrapProduct copyWith({Product? node}) {
    return WrapProduct(
      node: node ?? this.node,
    );
  }

  factory WrapProduct.fromJson(Map<String, dynamic> json) {
    return WrapProduct(node: json['node'] as Product);
  }

  @override
  List<Object?> get props => [];
}
