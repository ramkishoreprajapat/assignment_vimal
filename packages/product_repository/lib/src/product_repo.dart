import 'package:graphql_flutter/graphql_flutter.dart';

abstract class ProductRepository {
  Future<QueryResult> getProducts(String accessToken);
}
