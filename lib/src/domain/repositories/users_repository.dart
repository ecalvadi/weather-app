import 'package:weather_app/src/domain/entities/user.dart';

abstract class UsersRepository {
  Future<User> getUser(String user);
}
