import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_zora_transaction_info.g.dart';

@JsonSerializable()
class DataZoraTransactionInfo {
  DataZoraTransactionInfo(
    this.blockTimestamp,
    this.txHash,
  );

  factory DataZoraTransactionInfo.fromJson(Map<String, dynamic> json) =>
      _$DataZoraTransactionInfoFromJson(json);

  @JsonKey(name: 'blockTimestamp')
  final String blockTimestamp;

  @JsonKey(name: 'transactionHash')
  final String txHash;
}
