import 'package:checker/features/loginbloc/data/datasources/login_remote_datasource.dart';
import 'package:checker/features/loginbloc/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource remoteDatasource;

  LoginRepositoryImpl({required this.remoteDatasource});
  
  @override
  Future<bool> login(String email, String password) {
   return remoteDatasource.login(email, password);
  }
}