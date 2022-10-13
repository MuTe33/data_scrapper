// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_zora_transaction_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataZoraTransactionInfo _$DataZoraTransactionInfoFromJson(
        Map<String, dynamic> json) =>
    DataZoraTransactionInfo(
      json['blockTimestamp'] as String,
      json['transactionHash'] as String,
    );

Map<String, dynamic> _$DataZoraTransactionInfoToJson(
        DataZoraTransactionInfo instance) =>
    <String, dynamic>{
      'blockTimestamp': instance.blockTimestamp,
      'transactionHash': instance.txHash,
    };
