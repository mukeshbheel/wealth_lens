import 'package:supabase/supabase.dart';
import 'package:wealth_lens/features/dashboard/data/models/asset_model.dart';
import 'package:wealth_lens/features/dashboard/data/models/liability_model.dart';

abstract class DashboardRemoteDatasource {
  Future<List<AssetModel>> fetchAssets();
  Future<List<LiabilityModel>> fetchLiabilities();
}

class DashboardRemoteDatasourceImpl extends DashboardRemoteDatasource {
  final SupabaseClient client;

  DashboardRemoteDatasourceImpl({required this.client});

  @override
  Future<List<AssetModel>> fetchAssets() async{
    final response = await client.from('assets').select().order('created_at');
    return (response as List).map((e) => AssetModel.fromJson(e)).toList();
  }

  @override
  Future<List<LiabilityModel>> fetchLiabilities() async {
    final response = await client.from('liabilities').select().order('created_at');
    return (response as List).map((e) => LiabilityModel.fromJson(e)).toList();
  }

}