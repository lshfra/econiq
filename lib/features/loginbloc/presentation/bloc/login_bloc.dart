import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/entities/user_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    // Register event handlers
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final success = await loginUsecase.execute(
          UserEntity(email: event.email, password: event.password),
        );
        if (success) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure('Invalid username or password'));
        }
      } catch (e) {
        emit(LoginFailure('An error occurred: ${e.toString()}'));
      }
    });
  }
}
