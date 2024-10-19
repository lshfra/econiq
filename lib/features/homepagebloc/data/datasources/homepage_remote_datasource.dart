import 'package:checker/features/homepagebloc/data/models/home_model.dart';
// 
abstract class HomeRemoteDatasource {
  Future<HomeModel> getHomeInfo();

}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  
  @override
  Future<HomeModel> getHomeInfo() async {
    // fetch API
    final response = await Future.delayed(
      Duration(seconds: 2),
    () => {"title": "Econique Scan Tiket", "logo_url": "assets/logi.png"},
    );
    return HomeModel.fromJson(response);
  }
  }