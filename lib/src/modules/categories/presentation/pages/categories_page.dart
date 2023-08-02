import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:findservices/src/modules/categories/presentation/controller/categories_controller.dart';
import 'package:findservices/src/modules/shared/components/footbar.dart';
import 'package:findservices/src/modules/shared/domain/entities/category_entity.dart';
import 'package:findservices/src/modules/shared/models/filter/filter_entity.dart';
import 'package:findservices/src/modules/shared/widgets/app_drawer.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final CategoriesController _categoriesController;

  @override
  void initState() {
    super.initState();
    _categoriesController = Modular.get<CategoriesController>();
    _categoriesController.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('FindServices'),
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Categorias',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _categoriesController.getCategoriesSize(),
                    itemBuilder: (context, index) {
                      CategoryEntity category =
                          _categoriesController.getCategory(index);
                      return GestureDetector(
                        onTap: () {
                          Modular.to.navigate('/home', arguments: {
                            "filter": FilterEntity(category: category.name)
                          });
                        },
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: _categoriesController
                                  .getCategoryImage(category.name!)
                                  .image,
                              fit: BoxFit.cover,
                            ),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.white70,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  category.description!,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(),
    );
  }
}
