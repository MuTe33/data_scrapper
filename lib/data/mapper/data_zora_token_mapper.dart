import 'package:data_scrapper/data/model/data_zora_top_sale.dart';
import 'package:data_scrapper/domain/model/feed_token.dart';

const ensContract = '0x57f1887a8bf19b14fc0df6fd9b2acc9af147ea85';

class DataZoraTokenMapper {
  FeedToken? map(DataZoraTopSale from) {
    final token = from.token;

    if (token == null) {
      return null;
    }

    return FeedToken(
      contractAddress: token.collectionAddress,
      tokenId: token.tokenId,
      name: _mapName(
        token.tokenId,
        token.collectionName,
        token.name,
      ),
      imageUrl: _mapImageUrl(token.image?.url),
      ethPrice: from.sale.price.ethPrice.decimal,
      fiatPrice: from.sale.price.usdcPrice.decimal,
    );
  }

  String? _mapName(String tokenId, String? collectionName, String? tokenName) {
    if (tokenName != null) {
      return tokenName;
    }

    if (collectionName != null) {
      return '$collectionName $tokenId';
    }

    return tokenId;
  }

  String? _mapImageUrl(String? imageUrl) {
    if (imageUrl == null) return null;

    if (imageUrl.contains('svg')) return null;

    return imageUrl;
  }
}
