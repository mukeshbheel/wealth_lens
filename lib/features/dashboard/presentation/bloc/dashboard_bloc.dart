import 'package:bloc/bloc.dart';
import 'package:wealth_lens/features/dashboard/domain/usecases/get_dashboard_data.dart';
import 'package:wealth_lens/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:wealth_lens/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final GetDashboardData getDashboardData;

  DashboardBloc(this.getDashboardData) : super(DashboardInitial()){
    on<LoadDashboard>((event, emit) async {
      emit(DashboardLoading());
      try{
        final data = await getDashboardData();
        emit(DashboardLoaded(data));
      } catch (e) {
        emit(DashboardError(e.toString()));
      }
    });
  }

}