import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/swaps/data/repos/swap_repo.dart';

part 'accept_request_cubit_state.dart';

class AcceptRequestCubit extends Cubit<AcceptRequestCubitState> {
  AcceptRequestCubit() : super(AcceptRequestInitial());
  final repo = getIt<SwapRepo>();

  Future<void> acceptRequest({
    required String requestId,
    required String senderId,
    required String receiverId,
  }) async {
    emit(AcceptRequestLoading());

    final result = await repo.acceptRequest(
      requestId: requestId,
      senderId: senderId,
      receiverId: receiverId,
    );

    result.fold(
      (failure) {
        emit(AcceptRequestFailure(failure.toString()));
      },
      (_) {
        emit(AcceptRequestSuccess());
      },
    );
  }
}
