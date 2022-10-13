import 'package:dio/dio.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:graphql/client.dart';

const _zoraBaseUrl = 'https://api.zora.co/graphql';

class GraphQLClientFactory {
  GraphQLClient buildClient() {
    final dioLink = DioLink(_zoraBaseUrl, client: Dio());
    final cache = GraphQLCache();

    return GraphQLClient(link: dioLink, cache: cache);
  }
}
