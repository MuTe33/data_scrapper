import 'package:data_scrapper/data/mapper/data_zora_tx_mapper.dart';
import 'package:data_scrapper/data/model/data_zora_top_sale.dart';
import 'package:data_scrapper/domain/model/feed_event.dart';
import 'package:data_scrapper/domain/model/feed_event_place.dart';
import 'package:data_scrapper/domain/model/feed_tx_type.dart';

class DataZoraTopSaleMapper {
  DataZoraTopSaleMapper(this._dataZoraTxMapper);

  final DataZoraTxMapper _dataZoraTxMapper;

  FeedEvent? map(DataZoraTopSale from) {
    final tx = _dataZoraTxMapper.map(from);

    if (tx == null) {
      return null;
    }

    return FeedEvent(
      hash: from.sale.txInfo.txHash,
      timestamp: _toUnixTimestamp(from.sale.txInfo.blockTimestamp),
      tx: tx,
      eventPlace: _mapEventPlace(from.sale.saleType),
      txType: FeedTxType.purchase,
      txFee: null,
    );
  }

  String _toUnixTimestamp(String timestamp) {
    final dateTime = DateTime.tryParse(timestamp) ?? DateTime.now();

    return dateTime.microsecondsSinceEpoch.toString();
  }

  FeedEventPlace _mapEventPlace(String eventPlace) {
    switch (eventPlace) {
      case 'OPENSEA_SINGLE_SALE':
      case 'OPENSEA_BUNDLE_SALE':
      case 'SEAPORT_SALE':
        return FeedEventPlace.opensea;
      case 'LOOKS_RARE_SALE':
        return FeedEventPlace.looksrare;
      case 'FOUNDATION_SALE':
        return FeedEventPlace.foundation;
      case 'RARIBLE_SALE':
        return FeedEventPlace.rarible;
      case 'SUPERRARE_SALE':
        return FeedEventPlace.superrare;
      case 'CRYPTOPUNKS_SALE':
        return FeedEventPlace.cryptoPunks;
      case 'ZORA_V2_AUCTION_SALE':
      case 'ZORA_V3_ASK_SALE':
        return FeedEventPlace.zora;
      case 'NOUNS_AUCTION_SALE':
        return FeedEventPlace.nouns;
      case 'LIL_NOUNS_AUCTION_SALE':
        return FeedEventPlace.lilNouns;
      case 'ZEROX_SALE':
        return FeedEventPlace.zerox;
    }
    return FeedEventPlace.unknown;
  }
}
