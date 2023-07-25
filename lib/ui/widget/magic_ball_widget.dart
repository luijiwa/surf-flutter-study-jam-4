import 'package:flutter/material.dart';

class MagicBallWidget extends StatelessWidget {
  const MagicBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox(
          height: 300,
          width: 300,
          child: CircleAvatar(
            backgroundImage: AssetImage('images/bubble.png'),
          ),
        ),
      ],
    );
  }
}
