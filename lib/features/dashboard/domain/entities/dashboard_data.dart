import 'package:wealth_lens/features/dashboard/domain/entities/asset.dart';
import 'package:wealth_lens/features/dashboard/domain/entities/liability.dart';

class DashboardData {
  final List<Asset> assets;
  final List<Liability> liabilities;

  DashboardData({required this.assets, required this.liabilities});

  double get totalAssets => assets.fold(0, (sum, a) => sum + a.totalValue);
  double get totalLiabilities => liabilities.fold(0, (sum, l) => l.balance);
  double get netWorth => totalAssets - totalLiabilities;
}
