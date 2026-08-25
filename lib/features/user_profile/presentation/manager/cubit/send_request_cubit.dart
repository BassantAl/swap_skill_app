import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/features/user_profile/data/repos/user_profile_repo.dart';

part 'send_request_state.dart';

class SendRequestCubit extends Cubit<SendRequestState> {
  SendRequestCubit() : super(SendRequestInitial());
  final repo = getIt<UserProfileRepo>();
  Future<void> sendRequest({
    required String senderId,
    required String receiverId,
  }) async {
    emit(SendRequestLoading());
    final result = await repo.sendRequest(
      senderId: senderId,
      receiverId: receiverId,
    );
    result.fold(
      (failure) {
        emit(SendRequestFailure(message: failure.errorMessage));
      },
      (_) {
        emit(SendRequestSuccess());
      },
    );
  }
}
