import 'package:assignment_vimal/core/utils/shared_preference_singleton.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_repository/product_repository.dart';

import '../../../core/constants/strings.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ListProductEvent, ListProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ListProductInitial()) {
    on<ListProductRequired>((event, emit) async {
      try {
        var result = await productRepository.getProducts(
            SharedPreferenceSingleton()
                .getString(SharedPreferenceSingleton.accessToken));

        if (result.hasException) {
          emit(ListProductFailure(message: result.exception.toString()));
        } else {
          List<Product> productList = [];
          for(int i = 0; i < result.data?['products']['edges'].length; i++){            
            productList.add(Product.fromJson(result.data?['products']['edges'][i]['node']));
          }
         
          emit(ListProductSuccess(productList));
        }
      } catch (e) {
        emit(const ListProductFailure(message: Strings.someThingWentWrong));
      }
    });

    on<RefreshProductRequired>((event, emit) async {
      emit(ListProductInitial());
      add(const ListProductRequired());
    });
  }
}
