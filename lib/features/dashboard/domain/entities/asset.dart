class Asset {
  final String id;
  final String category;
  final String name;
  final double quantity;
  final double manualValue;
  final DateTime createdAt;

  Asset({
    required this.id,
    required this.category,
    required this.name,
    required this.quantity,
    required this.manualValue,
    required this.createdAt,
  });

  double get totalValue => quantity * manualValue;
}
