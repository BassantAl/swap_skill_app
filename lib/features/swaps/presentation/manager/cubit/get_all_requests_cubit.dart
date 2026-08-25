import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo.dart';

part 'get_all_requests_state.dart';

class GetAllRequestsCubit extends Cubit<GetAllRequestsState> {
  GetAllRequestsCubit() : super(GetAllRequestsInitial());
  final repo = getIt<SwapRepo>();

  Future<void> getAllRequests() async {
    emit(GetAllRequestsLoading());
    final result = await repo.getAllRequests();
    result.fold(
      (failure) {
        emit(GetAllRequestsFailure(errorMessage: failure.errorMessage));
      },
      (data) {
        emit(GetAllRequestsSuccess(requests: data));
      },
    );
  }
}
