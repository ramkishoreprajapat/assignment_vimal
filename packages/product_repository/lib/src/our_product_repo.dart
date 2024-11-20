import 'package:graphql_flutter/graphql_flutter.dart';

import '../product_repository.dart';
import 'graph_ql_service.dart';

class OurProductRepo implements ProductRepository {
  @override
  Future<QueryResult> getProducts(String accessToken) async {
    const String fetchProductsQuery = """
        query getProductsByType(
  \$filter: ProductFilter!
  \$sorting: [ProductSort!]
  \$paging: CursorPaging
) {
  products(
    filter: {
      and: [{ statusId: { eq: 1 } }, { deleted: { eq: 0 } }, { and: [\$filter] }]
    }
    sorting: \$sorting
    paging: \$paging
  ) {
    __typename
    edges {
      __typename
      node {
        __typename
        id
        name
        groupColor
        groupSortOrder
        type
        price
        cost
        favourite
        isFood
        status {
          __typename
          id
          name
        }
        productDetails
        saleTax {
          __typename
          id
          accountId
          name
          code
          rate
        }
        purchaseTax {
          __typename
          id
          accountId
          name
          code
          rate
        }
        unit {
          __typename
          id
          code
          name
        }
        categories {
          __typename
          nodes {
            __typename
            id
            name
          }
        }
        productVariants(
          filter: { deleted: { eq: 0 } }
          sorting: [{ field: position, direction: ASC }]
          paging: { limit: 100 }
        ) {
          __typename
          nodes {
            __typename
            id
            name
            sku
            barcode
            position
            cost
            price
            warehouseProductVariants {
              __typename
              nodes {
                __typename
                warehouseId
                availableQuantity
                reservedQuantity
                warehouse {
                  __typename
                  id
                  name
                  accountId
                }
              }
            }
            productVariantAttributes(
              sorting: [{ field: sortOrder, direction: ASC }]
            ) {
              __typename
              nodes {
                __typename
                variantId
                attributeValueId
                sortOrder
                attributeValue {
                  __typename
                  id
                  attributeId
                  name
                  skuFragment
                  isArchived
                  sortOrder
                  attribute {
                    __typename
                    id
                    name
                    displayName
                    variantAttributeValues {
                      __typename
                      id
                      attributeId
                      name
                      skuFragment
                      isArchived
                      sortOrder
                    }
                  }
                }
              }
            }
            warehouseProductVariantsAggregate {
              __typename
              sum {
                __typename
                availableQuantity
              }
            }
            productVariantPhotos(
              sorting: [{ field: sortOrder, direction: ASC }]
              paging: { limit: 20 }
            ) {
              __typename
              nodes {
                __typename
                file {
                  __typename
                  id
                  path
                  thumbnailPath
                }
              }
            }
          }
        }
        depot {
          __typename
          id
          name
          price
          unit {
            __typename
            id
            code
            name
          }
          productVariants(
            filter: { deleted: { eq: 0 } }
            sorting: [{ field: position, direction: ASC }]
            paging: { limit: 1 }
          ) {
            __typename
            nodes {
              __typename
              id
            }
          }
          saleTaxId
          saleTax {
            __typename
            id
            accountId
            name
            code
            rate
          }
        }
      }
    }
    pageInfo {
      __typename
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
  }
}
      """;
    try {
      final client = GraphQLService.getClient(accessToken);
      final QueryOptions options = QueryOptions(
        document: gql(fetchProductsQuery),
        variables: const {
          'operationName': fetchProductsQuery,
          'variables': {},
          'filter': {'and': []},
          'sorting': [
            {'field': 'favourite', 'direction': 'DESC'}
          ],
          'paging': {'first': 20}
        },
      );
      QueryResult result = await client.query(options);
      return result;     
    } catch (e) {
      rethrow;
    }
  }
}
