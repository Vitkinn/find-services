import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tcc_frontend/src/modules/home/data/models/service_provider_list_model.dart';
import 'package:tcc_frontend/src/modules/home/presentation/controllers/home_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController;
  List<bool> isStarredList = List.filled(10, false);

  @override
  void initState() {
    super.initState();

    _homeController = Modular.get<HomeController>();
    _homeController.loadPage(Modular.args.data?['filter']);
    _homeController.loading.addListener(() {
      setState(() {});
    });
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
      body: Visibility(
        replacement: const Center(child: CircularProgressIndicator()),
        visible: !_homeController.loading.value,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _homeController.filterController,
                    hintText: 'Pesquise por um serviço, prestador, etc...',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        _homeController.filterByName();
                      },
                    ),
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Prestadores',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: _homeController.filter != null &&
                              _homeController.filter!.category != null,
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                                color: Colors.green[400], borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Text(
                                    '${_homeController.getFilterName()}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                CloseButton(
                                  onPressed: () {
                                    _homeController.clearCategory();
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _homeController.serviceProviders.length,
                      itemBuilder: (BuildContext context, int index) {
                        ServiceProviderModel serviceProvider =
                            _homeController.serviceProviders[index];
                        return GestureDetector(
                          onTap: () {
                            _homeController.navigateToProfile(serviceProvider.id!);
                          },
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible: _homeController.hasImage(serviceProvider),
                                      replacement: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                          image: DecorationImage(
                                            image: AssetImage('lib/assets/images/user_icon.png'),
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                _homeController.getPhotoUrl(serviceProvider)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '${serviceProvider.user!.name!} ${serviceProvider.user!.lastName}',
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green[400],
                                                borderRadius: BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(3.8),
                                              child: Text(
                                                '${_homeController.translateCategory(serviceProvider)}',
                                                style: const TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            '${serviceProvider.description}',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       isStarredList[index] = !isStarredList[index];
                                    //     });
                                    //   },
                                    //   child: Icon(
                                    //     isStarredList[index] ? Icons.star : Icons.star_border,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(),
    );
  }
}
