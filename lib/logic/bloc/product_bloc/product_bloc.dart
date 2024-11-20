import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

import '../../../core/constants/strings.dart';
import '../../../core/utils/utility.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ListProductEvent, ListProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ListProductInitial()) {
    on<ListProductRequired>((event, emit) async {
      try {
        var productList = await productRepository.getProducts();
        emit(ListProductSuccess(productList));
      } catch (e) {
       Utility().debug(e.toString());
        emit(const ListProductFailure(message: Strings.someThingWentWrong));
      }
    });
  }
}
