import 'package:checker/features/homepagebloc/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<HomeEntity> getHomeInfo();
}