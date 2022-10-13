import 'package:data_scrapper/data/model/data_zora_top_sale.dart';
import 'package:data_scrapper/domain/model/feed_token.dart';

const ensContract = '0x57f1887a8bf19b14fc0df6fd9b2acc9af147ea85';

class DataZoraTokenMapper {
  FeedToken? map(DataZoraTopSale from) {
    final collectionName = from.token.collectionName;
    final isEns = from.token.collectionAddress.contains(ensContract);

    if (collectionName == null && !isEns) {
      return null;
    }

    return FeedToken(
      collectionAddress: from.token.collectionAddress,
      collectionName: isEns ? 'ENS' : collectionName!,
      tokenId: from.token.tokenId,
      name: from.token.name,
      imageUrl: from.token.image?.url,
      ethPrice: from.sale.price.ethPrice.decimal,
      fiatPrice: from.sale.price.usdcPrice.decimal,
    );
  }
}
