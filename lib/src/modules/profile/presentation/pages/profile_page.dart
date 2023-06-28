import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/profile_evaluation_entity.dart';
import 'package:tcc_frontend/src/modules/profile/domain/entities/user_profile_entity.dart';
import 'package:tcc_frontend/src/modules/profile/presentation/controllers/profile_controller.dart';
import 'package:tcc_frontend/src/modules/shared/controllers/i_auth_controller.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/app_drawer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/custom_shimmer.dart';
import 'package:tcc_frontend/src/modules/shared/widgets/return_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileController _profileController;
  late final IAuthController _authController;
  String? _userId;

  @override
  void initState() {
    super.initState();
    _authController = Modular.get<IAuthController>();
    _profileController = Modular.get<ProfileController>();
    _profileController.stateChange.addListener(stateChange);

    if (Modular.args.data?['profilerId'] != null) {
      _userId = Modular.args.data?['profilerId'];
      _profileController.loadPage(_userId!);
    } else {
      _profileController.loadPage(null);
    }
  }

  void stateChange() {
    setState(() {});
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text('FindServices'),
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Visibility(
                  visible: Modular.args.data?['profilerId'] == null,
                  replacement: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReturnButton(onTap: _profileController.backToHome),
                        ],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReturnButton(onTap: _profileController.backToHome),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              child: const Text(
                                'Editar',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF14cd84),
                                ),
                              ),
                              onTap: () {
                                _profileController.edit();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageLoading(
                      radius: 75,
                      size: 125,
                      loading: _profileController.isProfileLoading,
                      userProfile: _profileController.userProfile,
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
                Visibility(
                  visible: Modular.args.data?['profilerId'] != null,
                  child: ElevatedButton(
                    onPressed: _profileController.isProfileLoading
                        ? null
                        : () {
                            _profileController.sendServiceRequest();
                          },
                    child: const Text('Solicitar'),
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
                              radius: 15,
                              size: 65,
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
                                  )
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
    );
  }
}

class TextVisible extends StatelessWidget {
  final bool visible;
  final String text;

  const TextVisible({
    Key? key,
    required this.visible,
    required this.text,
  }) : super(key: key);

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

class ImageLoading extends StatelessWidget {
  final bool loading;
  final UserProfileEntity? userProfile;
  final double radius;
  final double size;

  const ImageLoading({
    Key? key,
    required this.radius,
    required this.loading,
    required this.size,
    this.userProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Visibility(
        visible: !loading,
        replacement: Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(image: AssetImage('lib/assets/images/user_icon.png'))),
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(image: getImage(userProfile))),
        ),
      ),
    );
  }

  ImageProvider getImage(UserProfileEntity? userProfileEntity) {
    if (userProfileEntity?.photoUrl != null && userProfileEntity?.photoUrl != "") {
      var imageUrl = 'https://storage.googleapis.com${userProfileEntity!.photoUrl!}';
      return NetworkImage(imageUrl);
    }
    return const AssetImage('lib/assets/images/user_icon.png');
  }
}
