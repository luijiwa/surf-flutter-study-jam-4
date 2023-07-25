import 'package:flutter/material.dart';

class MagicBallWidget extends StatelessWidget {
  const MagicBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CircleAvatar(
          radius: 180,
          backgroundImage: AssetImage('images/bubble.png'),
        ),
      ],
    );
  }
}
