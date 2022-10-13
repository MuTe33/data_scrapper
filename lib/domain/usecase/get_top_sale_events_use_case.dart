import 'package:data_scrapper/data/repository/zora_remote_data_source.dart';
import 'package:data_scrapper/domain/model/feed_event.dart';

class GetTopSaleEventsUseCase {
  GetTopSaleEventsUseCase(this._zoraRemoteDataSource);

  final ZoraRemoteDataSource _zoraRemoteDataSource;

  Future<List<FeedEvent>> execute() {
    return _zoraRemoteDataSource.getTopSaleEvents();
  }
}
