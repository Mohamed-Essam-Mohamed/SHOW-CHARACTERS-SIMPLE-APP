import 'package:bloc_test/src/data/api/api.dart';
import 'package:bloc_test/src/data/model/response_character.dart';
import 'package:bloc_test/src/data/repository/character_contract.dart';
import 'package:dartz/dartz.dart';

class CharacterRepositoryImp implements CharacterRepositoryContract {
  CharacterRemoteDataSource characterRemoteDataSource;
  CharacterRepositoryImp(this.characterRemoteDataSource);

  @override
  Future<Either<Failer, ResponseCharacter>> getAllCharacterDetails() {
    return characterRemoteDataSource.getAllCharacterDetails();
  }
}
