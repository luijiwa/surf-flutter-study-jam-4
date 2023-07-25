import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/api_client/api_client.dart';
import 'package:surf_practice_magic_ball/ui/widget/magic_ball_widget.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 16, 12, 44),
              Color.fromARGB(255, 0, 0, 2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => ApiClient().getAnswer(),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  MagicBallWidget(),
                  ShadowBallWidget(),
                  Text('Нажмите на шар или потрясите телефон',style: TextStyle(fontSize: 16, color: ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShadowBallWidget extends StatelessWidget {
  const ShadowBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('images/shadow_min.png')),
        Image.asset('images/shadow_full.png'),
      ],
    );
  }
}
