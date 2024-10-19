import 'package:checker/features/loginbloc/data/repositories/login_repository_impl.dart';
import 'package:checker/features/loginbloc/domain/entities/user_entity.dart';
// import 'package:checker/features/loginbloc/domain/repositories/login_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase {
  final LoginRepositoryImpl repository;

  LoginUsecase({required this.repository});

  Future<bool> execute(UserEntity user)  async {
    try {
      // Lakukan autentikasi melalui repository (abstrak)
      return await repository.login(user.email, user.password);

    } catch (error) {
      throw Exception("error during login");
    }
    // return repository.login(user.username, user.password);
  }
}