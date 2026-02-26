part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<CategoryResponseEntity> categories;

  const CategorySuccess({required this.categories});
  @override
  List<Object> get props => [categories];
}

final class CategoryFailure extends CategoryState {
  final Failure errorMessage;
  const CategoryFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CategorySelected extends CategoryState {
  final int index;
  const CategorySelected({required this.index});
  @override
  List<Object> get props => [index];
}
