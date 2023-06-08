import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcc_frontend/src/modules/shared/components/footbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final _ratingController;
    double _rating = 4;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 75,
                      backgroundImage:
                          AssetImage('lib/assets/images/user_icon.png'),
                      backgroundColor: Colors.grey,
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
                const Text(
                  'Nome do Usuário',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                RatingBar(
                  initialRating: _rating,
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
                  '$_rating Avaliações',
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage('lib/assets/images/user_icon.png'),
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fulano de tal',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Ótimo cliente, acompanhou todo o processo do serviço.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: FootBar(),
    );
  }
}
