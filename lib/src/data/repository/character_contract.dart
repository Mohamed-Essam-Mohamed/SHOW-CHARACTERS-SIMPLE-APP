import 'package:bloc_test/src/data/api/api.dart';
import 'package:bloc_test/src/data/model/response_character.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepositoryContract {
  Future<Either<Failer, ResponseCharacter>> getAllCharacterDetails();
}

abstract class CharacterRemoteDataSource {
  Future<Either<Failer, ResponseCharacter>> getAllCharacterDetails();
}

abstract class CharacterLocalDataSource {}
