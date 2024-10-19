import 'package:checker/features/homepagebloc/data/datasources/homepage_remote_datasource.dart';
import 'package:checker/features/homepagebloc/domain/entities/home_entity.dart';
import 'package:checker/features/homepagebloc/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<HomeEntity> getHomeInfo() async {
    return await remoteDataSource.getHomeInfo();
  }

}