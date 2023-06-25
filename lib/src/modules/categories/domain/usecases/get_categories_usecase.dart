import 'package:dartz/dartz.dart';
import 'package:tcc_frontend/src/modules/categories/domain/entities/category_entity.dart';

class GetCategoriesUseCase {
  List<CategoryEntity> getCategories() {
    return [
      CategoryEntity(
        id: 1,
        name: 'ARCHITECT',
        description: 'Arquiteto',
      ),
      CategoryEntity(
        id: 2,
        name: 'FORWARDING_AGENT',
        description: 'Despachante',
      ),
      CategoryEntity(
        id: 3,
        name: 'ELECTRICIAN',
        description: 'Eletricista',
      ),
      CategoryEntity(
        id: 4,
        name: 'PLUMBER',
        description: 'Encanador',
      ),
      CategoryEntity(
        id: 5,
        name: 'ENGINEER',
        description: 'Engenheiro',
      ),
      CategoryEntity(
        id: 6,
        name: 'MECHANIC',
        description: 'Mecânico',
      ),
      CategoryEntity(
        id: 7,
        name: 'MASONS_ASSISTANT',
        description: 'Assistente de Pedreiro',
      ),
      CategoryEntity(
        id: 8,
        name: 'MASON',
        description: 'Pedreiro',
      ),
    ];
  }
}
