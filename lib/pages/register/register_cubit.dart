import 'package:bloc/bloc.dart';
import 'package:bloc_switch/core/exceptions/auth_exception.dart';
import 'package:bloc_switch/pages/register/register_state.dart';
import 'package:bloc_switch/repositories/register/register_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _registerRepository;
  RegisterCubit(
    this._registerRepository,
  ) : super(const RegisterState.initial());

  Future<void> register(email, password, displayName) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      await _registerRepository.register(email, password, displayName);
      emit(state.copyWith(status: RegisterStatus.register));
    } on AuthException catch (e) {
      emit(state.copyWith(
          status: RegisterStatus.error, errorMessage: () => e.message));
    }
  }
}
