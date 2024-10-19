import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboardingbloc_event.dart';
part 'onboardingbloc_state.dart';

class OnboardingblocBloc extends Bloc<OnboardingblocEvent, OnboardingblocState> {
  OnboardingblocBloc() : super(OnboardingblocInitial()) {
    on<OnboardingblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
