import 'dart:convert';
import 'dart:io';

import 'package:data_scrapper/data/mapper/data_zora_token_mapper.dart';
import 'package:data_scrapper/data/mapper/data_zora_top_sale_mapper.dart';
import 'package:data_scrapper/data/mapper/data_zora_tx_mapper.dart';
import 'package:data_scrapper/data/repository/zora_remote_data_source.dart';
import 'package:data_scrapper/domain/usecase/get_top_sale_events_use_case.dart';
import 'package:data_scrapper/graphql/graphql_client_factoy.dart';

const path = 'top_sale_events.json';

Future<void> main() async {
  final usecase = _initUseCase();

  final topSaleEvents = await usecase.execute();

  final eventsJson = topSaleEvents.map((event) => event.toJson()).toList();

  final eventsJsonAsFirebaseCollection = <String, dynamic>{
    'collection:feed_page_v2': <String, dynamic>{
      'top_sales': <String, dynamic>{
        'feed_entities': eventsJson,
      },
    }
  };

  await File(path).writeAsString(
    const JsonEncoder.withIndent('  ').convert(eventsJsonAsFirebaseCollection),
  );

  exit(0);
}

GetTopSaleEventsUseCase _initUseCase() {
  final _client = GraphQLClientFactory().buildClient();

  final _tokenMapper = DataZoraTokenMapper();
  final _txMapper = DataZoraTxMapper(_tokenMapper);
  final _topSaleMapper = DataZoraTopSaleMapper(_txMapper);

  final _remote = ZoraRemoteDataSource(_client, _topSaleMapper);

  return GetTopSaleEventsUseCase(_remote);
}
