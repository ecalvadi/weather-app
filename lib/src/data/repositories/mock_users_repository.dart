import 'package:weather_app/src/domain/entities/user.dart';

import 'package:weather_app/src/domain/repositories/users_repository.dart';

class MockUsersRepository extends UsersRepository {
  List<User> users = <User>[];

  //singleton
  static final MockUsersRepository _instance = MockUsersRepository._internal();

  MockUsersRepository._internal() {
    users = <User>[]; //clean users List
    users.addAll([
      User(user: 'user', pass: 'user', name: 'User'),
      User(user: 'test', pass: 'Test', name: 'Test User')
    ]);
  }

  factory MockUsersRepository() => _instance;

  @override
  Future<User> getUser(String name) async {
    return users.firstWhere((user) => user.name == name );
  }
}
