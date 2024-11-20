import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static GraphQLClient getClient(String accessToken) {
    
    final HttpLink httpLink =
        HttpLink('https://dev.payyap.ch:4443/graphql', defaultHeaders: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    },);
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
