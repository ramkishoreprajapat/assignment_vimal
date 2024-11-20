import '../product_repository.dart';


class OurProductRepo implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    List<Product> mList = [];
    return mList;
  }
}
