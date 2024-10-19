import 'package:checker/features/homepagebloc/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({required title, required logoUrl}): super(title: title, logoUrl: logoUrl);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(title: json['title'], logoUrl: json['logo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'logo_url': logoUrl,
    };
  }
  
}