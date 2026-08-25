import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo.dart';

part 'decline_request_state.dart';

class DeclineRequestCubit extends Cubit<DeclineRequestState> {
  DeclineRequestCubit() : super(DeclineRequestInitial());
  final repo = getIt<SwapRepo>();
  Future<void> declineRequest({required String requestId}) async {
    emit(DeclineRequestLoading());

    final result = await repo.declineRequest(requestId: requestId);

    result.fold(
      (l) {
        emit(DeclineRequestFailure(l.errorMessage));
      },
      (_) {
        emit(DeclineRequestSuccess());
      },
    );
  }
}
