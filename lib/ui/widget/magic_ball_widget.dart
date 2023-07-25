import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/api_client/api_client.dart';

class MagicBallWidget extends StatelessWidget {
  final bool visible;
  const MagicBallWidget({
    super.key,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ApiClient().getAnswer();
      },
      child: const Stack(
        children: [
          CircleAvatar(
            radius: 180,
            backgroundImage: AssetImage('images/bubble.png'),
          ),
          FadingCircle(),
          Text('')
        ],
      ),
    );
  }
}

class FadingCircle extends StatelessWidget {
  const FadingCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      width: 360,
      child: AnimatedOpacity(
        opacity: true ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 1,
              center: Alignment.center,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
