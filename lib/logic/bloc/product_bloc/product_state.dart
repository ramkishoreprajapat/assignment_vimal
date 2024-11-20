part of 'product_bloc.dart';

sealed class ListProductState extends Equatable {
  const ListProductState();

  @override
  List<Object> get props => [];
}

final class ListProductInitial extends ListProductState {}

class ListProductSuccess extends ListProductState {
  final List<Product>? productList;
  const ListProductSuccess(
    this.productList,
  );
}

class ListProductFailure extends ListProductState {
  final String? message;

  const ListProductFailure({this.message});
}

class ListProductProcess extends ListProductState {}
