import 'package:wealth_lens/features/dashboard/domain/entities/asset.dart';
import 'package:wealth_lens/features/dashboard/domain/entities/liability.dart';

abstract class DashboardRepository {
  Future<List<Asset>> getAssets();
  Future<List<Liability>> getLiabilities();
}