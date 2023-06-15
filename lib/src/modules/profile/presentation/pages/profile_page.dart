import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_controller.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_shimmer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileController _profileController;

  @override
  void initState() {
    super.initState();

    _profileController = Modular.get<ProfileController>()..loadPage();
    _profileController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _profileController.disposePage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      child: const Text(
                        'Editar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF14cd84)),
                      ),
                      onTap: () => {_profileController.edit()},
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ImageLoading(
                      loading: _profileController.isProfileLoading,
                      getImageWidget: _profileController.getImage,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(75),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: !_profileController.isProfileLoading,
                  replacement: const CustomShimmer(width: 80, height: 15),
                  child: ValueListenableBuilder(
                      valueListenable: _profileController.userProfile,
                      builder: (context, value, child) {
                        return Text(
                          _profileController.getName(value),
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20),
                RatingBar(
                  initialRating: _profileController.rating,
                  direction: Axis.horizontal,
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: Image.asset('lib/assets/images/star.png'),
                    half: Image.asset('lib/assets/images/star_half.png'),
                    empty: Image.asset('lib/assets/images/star_border.png'),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {},
                  itemSize: 25,
                ),
                const SizedBox(height: 20),
                Text(
                  '${_profileController.rating} Avaliações',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Na plataforma desde _date',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 50),
                const Text('Comentários', style: TextStyle(fontSize: 25)),
                const SizedBox(height: 25),
                ListView.builder(
                  itemCount: _profileController.evaluation.evaluations!.length,
                  itemBuilder: (context, index) {
                    EvaluationEntity evaluation = _profileController.getEvaluation(index);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('lib/assets/images/user_icon.png'),
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _profileController.getName(evaluation.user),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                _profileController.getEvaluation(index).message!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FootBar(initialIndex: 2),
    );
  }
}

typedef ImageBuild = ImageProvider Function();

class ImageLoading extends StatelessWidget {
  final bool loading;
  final ImageBuild getImageWidget;

  const ImageLoading({
    super.key,
    required this.loading,
    required this.getImageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !loading,
      replacement: const CircleAvatar(
        radius: 75,
        backgroundImage: AssetImage('lib/assets/images/user_icon.png'),
        backgroundColor: Colors.grey,
      ),
      child: CircleAvatar(
        radius: 75,
        backgroundImage: getImageWidget.call(),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
