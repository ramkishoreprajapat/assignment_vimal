import 'models/models.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
