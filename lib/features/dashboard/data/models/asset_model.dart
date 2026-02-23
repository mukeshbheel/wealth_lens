import 'package:wealth_lens/features/dashboard/domain/entities/asset.dart';

class AssetModel extends Asset {
  AssetModel({
    required super.id,
    required super.category,
    required super.name,
    required super.quantity,
    required super.manualValue,
    required super.createdAt,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      quantity: (json['quantity'] as num).toDouble(),
      manualValue: (json['manualValue'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
