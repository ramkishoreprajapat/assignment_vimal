part of 'product_bloc.dart';

sealed class ListProductEvent extends Equatable {
  const ListProductEvent();

  @override
  List<Object> get props => [];
}

class ListProductRequired extends ListProductEvent {
  const ListProductRequired();
}

class RefreshProductRequired extends ListProductEvent {
  const RefreshProductRequired();
}
