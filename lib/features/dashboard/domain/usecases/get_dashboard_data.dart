import 'package:wealth_lens/features/dashboard/domain/entities/dashboard_data.dart';
import 'package:wealth_lens/features/dashboard/domain/repositories/dashboard_repository.dart';

class GetDashboardData {
  final DashboardRepository repository;

  GetDashboardData({required this.repository});

  Future<DashboardData> call() async {
    final assets = await repository.getAssets();
    final liabilities = await repository.getLiabilities();

    return DashboardData(assets: assets, liabilities: liabilities);
  }

}