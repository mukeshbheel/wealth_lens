import 'package:wealth_lens/features/dashboard/domain/entities/liability.dart';

class LiabilityModel extends Liability {
  LiabilityModel({
    required super.id,
    required super.category,
    required super.name,
    required super.balance,
    required super.createdAt,
  });

  factory LiabilityModel.fromJson(Map<String, dynamic> json) {
    return LiabilityModel(
      id: json['id'],
      category: json['category'],
      name: json['name'],
      balance: (json['balance'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
