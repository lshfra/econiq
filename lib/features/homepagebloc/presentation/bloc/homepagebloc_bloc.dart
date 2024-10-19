import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checker/features/homepagebloc/domain/entities/home_entity.dart';
import 'package:checker/features/homepagebloc/domain/usecases/get_home_info.dart';
import 'package:equatable/equatable.dart';


part 'homepagebloc_event.dart';
part 'homepagebloc_state.dart';

class HomepageblocBloc extends Bloc<HomepageblocEvent, HomepageblocState> {

  final GetHomeInfo getHomeInfo;

  HomepageblocBloc(this.getHomeInfo) : super(HomeInitial()) {
    on<HomepageblocEvent>((event, emit) async {
      emit(HomeLoading());

      try {
        final homeEntity = await getHomeInfo.execute();
        emit(HomeLoaded(homeEntity));
      } catch (e) {
        emit(HomeError("Failed to load data"));
      }
    });
  }
}
