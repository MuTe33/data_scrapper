import 'package:collection/collection.dart';
import 'package:data_scrapper/data/mapper/data_zora_top_sale_mapper.dart';
import 'package:data_scrapper/data/model/data_zora_top_sale.dart';
import 'package:data_scrapper/domain/model/feed_event.dart';
import 'package:graphql/client.dart';

class ZoraRemoteDataSource {
  ZoraRemoteDataSource(
    this._client,
    this._dataZoraTopSaleMapper,
  );

  final GraphQLClient _client;
  final DataZoraTopSaleMapper _dataZoraTopSaleMapper;

  Future<List<FeedEvent>> getTopSaleEvents() async {
    final queryOptions = QueryOptions<List<Map<String, dynamic>>>(
      document: gql(_topSalesQuery),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.none,
    );

    final response = await _client.query(queryOptions);

    if (response.hasException) {
      throw Exception(response.exception);
    }

    final result = List<Map<String, dynamic>>.from(
      response.data!['sales']['nodes'],
    );

    return result
        .map(DataZoraTopSale.fromJson)
        .map(_dataZoraTopSaleMapper.map)
        .whereNotNull()
        .toList();
  }
}

// exclude LooksRare because of wash trading
const String _topSalesQuery = '''
query TopSalesLast24h {
  sales(
    filter: {
      priceFilter: {minimumChainTokenPrice: "30"}, 
      timeFilter: {lookbackHours: 72}, 
      saleTypes: [OPENSEA_SINGLE_SALE, OPENSEA_BUNDLE_SALE, SEAPORT_SALE, FOUNDATION_SALE, RARIBLE_SALE, SUPERRARE_SALE, CRYPTOPUNKS_SALE,ZORA_V2_AUCTION_SALE, ZORA_V3_ASK_SALE, NOUNS_AUCTION_SALE, LIL_NOUNS_AUCTION_SALE, ZEROX_SALE]
    }
    pagination: {limit: 300}
    sort: {sortKey: TIME, sortDirection: DESC}
  ) {
    nodes {
      sale {
        transactionInfo {
          blockTimestamp
          transactionHash
        }
        price {
          usdcPrice {
            decimal
          }
          chainTokenPrice {
            decimal
            currency {
              name
            }
          }
        }
        saleType
        buyerAddress
        sellerAddress
      }
      token {
        collectionAddress
        collectionName
        name
        tokenId
        image {
          url
        }
      }
    }
  }
}
''';
