import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
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
    _profileController.stateChange.addListener(stateChange);
  }

  void stateChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _profileController.stateChange.removeListener(stateChange);
    _profileController.disposePage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
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
                      radius: 75,
                      loading: _profileController.isProfileLoading,
                      userProfile: _profileController.userProfile,
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
                  child: Text(
                    _profileController.getName(_profileController.userProfile),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: !_profileController.isEvaluationsLoading,
                  replacement: Container(),
                  child: Column(
                    children: [
                      RatingBar(
                        initialRating: _profileController.getUserRating(),
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
                        '${_profileController.evaluation.quantity} Avaliações',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextVisible(
                  visible: !_profileController.isProfileLoading,
                  text: 'Na plataforma desde ${_profileController.getCreateAccountDate()}',
                ),
                const SizedBox(height: 50),
                const Text('Comentários', style: TextStyle(fontSize: 25)),
                const SizedBox(height: 25),
                Visibility(
                  visible: !_profileController.isEvaluationsLoading,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: _profileController.getEvaluationsSize(),
                    itemBuilder: (context, index) {
                      EvaluationEntity evaluation = _profileController.getEvaluation(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageLoading(
                              radius: 25,
                              userProfile: evaluation.user,
                              loading: _profileController.isEvaluationsLoading,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${_profileController.getName(evaluation.user)} - ',
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      Text(
                                        _profileController.getEvaluationDate(evaluation),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    evaluation.comment!,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
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
      bottomNavigationBar: const FootBar(initialIndex: 2),
    );
  }
}

class TextVisible extends StatelessWidget {
  final bool visible;
  final String text;

  const TextVisible({
    super.key,
    required this.visible,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      replacement: Container(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

typedef ImageBuild = ImageProvider Function(UserProfileEntity? userProfileEntity);

class ImageLoading extends StatelessWidget {
  final bool loading;
  final UserProfileEntity? userProfile;
  final double radius;

  const ImageLoading({
    super.key,
    this.userProfile,
    required this.radius,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !loading,
      replacement: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('lib/assets/images/user_icon.png'),
        backgroundColor: Colors.grey,
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: getImage(userProfile),
        backgroundColor: Colors.grey,
      ),
    );
  }

  ImageProvider getImage(UserProfileEntity? userProfileEntity) {
    if (userProfileEntity?.photoUrl != null && userProfileEntity?.photoUrl != "") {
      return NetworkImage(userProfileEntity!.photoUrl!);
    }
    return const AssetImage('lib/assets/images/user_icon.png');
  }
}
