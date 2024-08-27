import 'package:project_list_fliutter/src/modules/auth/domain/repositories/login_repository.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/adapters/auth_adapter.dart';
import 'package:project_list_fliutter/src/modules/auth/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  //retornar um User
  @override
  Future<String> login(String username, String password) async {
    try {
      final userProto = await datasource.login(username, password);

      final userModel = AuthAdapter.decodeProto(userProto.writeToBuffer());

      return userModel.id;
    } catch (e) {
      throw Error();
    }
  }

}
