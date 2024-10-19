import 'package:checker/features/homepagebloc/domain/entities/home_entity.dart';
import 'package:checker/features/homepagebloc/domain/repositories/home_repository.dart';


class GetHomeInfo {
  final HomeRepository repository;

  GetHomeInfo(this.repository);

  Future<HomeEntity> execute() async {
    return await repository.getHomeInfo();
  }
}