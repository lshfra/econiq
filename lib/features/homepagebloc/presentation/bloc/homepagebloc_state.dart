part of 'homepagebloc_bloc.dart';

abstract class HomepageblocState extends Equatable {
  const HomepageblocState();  

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomepageblocState {}
class HomeLoading extends HomepageblocState {}
class HomeLoaded extends HomepageblocState {
  final HomeEntity home;

  HomeLoaded(this.home);

  @override
  List<Object?> get props => [home];
  }

  class HomeError extends HomepageblocState {
    final String message;

  HomeError(this.message);

  @override
  List<Object?> get props => [message];
  }