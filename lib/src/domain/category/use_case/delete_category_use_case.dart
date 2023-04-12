import '../repository/category_repository.dart';

class DeleteCategoryUseCase {
  final CategoryRepository categoryRepository;

  DeleteCategoryUseCase({required this.categoryRepository});

  Future<void> call(int key) => categoryRepository.deleteCategory(key);
}
