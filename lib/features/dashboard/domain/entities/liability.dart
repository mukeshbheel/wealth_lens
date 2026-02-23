class Liability {
  final String id;
  final String category;
  final String name;
  final double balance;
  final DateTime createdAt;

  Liability({
    required this.id,
    required this.category,
    required this.name,
    required this.balance,
    required this.createdAt,
  });
}