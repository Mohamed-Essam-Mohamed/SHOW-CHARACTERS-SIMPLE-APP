import 'package:bloc/bloc.dart';
import 'package:bloc_test/src/data/repository/character_contract.dart';
import 'package:bloc_test/src/data/repository/data_source/character_data_source.dart';
import 'package:bloc_test/src/data/repository/repository/character_repository_imp.dart';
import '../../../data/api/api.dart';
import '../../../data/model/response_character.dart';
import 'package:meta/meta.dart';

part 'home_view_model_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  late CharacterRepositoryContract characterRepositoryContract;
  late CharacterRemoteDataSource characterRemoteDataSource;
  late AppApi appApi;
  HomeScreenCubit() : super(HomeScreenLoading()) {
    appApi = AppApi();
    characterRemoteDataSource = CharacterRemoteDataSourceImp(appApi);
    characterRepositoryContract =
        CharacterRepositoryImp(characterRemoteDataSource);
  }

  void getCharacters() async {
    emit(HomeScreenLoading());

    var either = await characterRepositoryContract.getAllCharacterDetails();
    either.fold((l) {
      emit(HomeScreenError(massage: l.massage));
    }, (r) {
      emit(HomeScreenLoaded(characters: r));
    });
  }
}
