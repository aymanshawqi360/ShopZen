import 'package:equatable/equatable.dart';

class CategoryResponseEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  const CategoryResponseEntity({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, image];
}
