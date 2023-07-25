import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/ui/widget/magic_ball_widget.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 2),
            colors: [
              Color.fromARGB(255, 16, 12, 44),
              Color.fromARGB(255, 0, 0, 2),
            ],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                MagicBallWidget(),
                ShadowBallWidget(),
                Text(
                  'Нажмите на шар или потрясите телефон',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                )
              ],
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
