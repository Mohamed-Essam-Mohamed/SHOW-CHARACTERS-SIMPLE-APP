part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenLoaded extends HomeScreenState {
  final ResponseCharacter characters;
  HomeScreenLoaded({required this.characters});
}

final class HomeScreenError extends HomeScreenState {
  String? massage;
  HomeScreenError({required this.massage});
}
