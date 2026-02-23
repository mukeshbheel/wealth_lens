import 'package:wealth_lens/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:wealth_lens/features/dashboard/domain/entities/asset.dart';
import 'package:wealth_lens/features/dashboard/domain/entities/liability.dart';
import 'package:wealth_lens/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardRemoteDatasource remote;

  DashboardRepositoryImpl({required this.remote});

  @override
  Future<List<Asset>> getAssets() => remote.fetchAssets();

  @override
  Future<List<Liability>> getLiabilities() => remote.fetchLiabilities();

}