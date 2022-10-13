import 'package:data_scrapper/data/mapper/data_zora_token_mapper.dart';
import 'package:data_scrapper/data/model/data_zora_top_sale.dart';
import 'package:data_scrapper/domain/model/feed_tx.dart';

class DataZoraTxMapper {
  DataZoraTxMapper(this._dataZoraTokenMapper);

  final DataZoraTokenMapper _dataZoraTokenMapper;

  FeedTx? map(DataZoraTopSale from) {
    final token = _dataZoraTokenMapper.map(from);

    if (token == null) {
      return null;
    }

    return FeedTx(
      mainAddress: from.sale.buyerAddress,
      secondaryAddress: from.sale.sellerAddress,
      tokens: [token],
    );
  }
}
