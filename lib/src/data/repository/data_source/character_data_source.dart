import 'package:bloc_test/src/data/api/api.dart';
import 'package:bloc_test/src/data/model/response_character.dart';
import 'package:bloc_test/src/data/repository/character_contract.dart';
import 'package:dartz/dartz.dart';

class CharacterRemoteDataSourceImp implements CharacterRemoteDataSource {
  AppApi appApi;
  CharacterRemoteDataSourceImp(this.appApi);
  @override
  Future<Either<Failer, ResponseCharacter>> getAllCharacterDetails() async {
    var either = await appApi.getAllCharacterDetails();
    return either.fold((l) {
      return Left(Failer(massage: l.massage));
    }, (r) {
      return Right(r);
    });
  }
}
