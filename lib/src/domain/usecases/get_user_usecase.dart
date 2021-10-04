import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:weather_app/src/domain/entities/user.dart';
import 'package:weather_app/src/domain/repositories/users_repository.dart';

class GetUserUseCase
    extends UseCase<GetUserUseCaseResponse, GetUserUseCaseParams> {
  final UsersRepository usersRepository;
  GetUserUseCase(this.usersRepository);

  @override

  @override
  Future<Stream<GetUserUseCaseResponse?>> buildUseCaseStream(
    GetUserUseCaseParams? params,
  ) async {
    final controller = StreamController<GetUserUseCaseResponse>();
    try {
      final user = await usersRepository.getUser(params!.name);
      controller.add(GetUserUseCaseResponse(user));
      logger.finest('GetUserUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetUserUseCaseParams {
  final String name;
  GetUserUseCaseParams(this.name);
}

class GetUserUseCaseResponse {
  final User user;
  GetUserUseCaseResponse(this.user);
}
