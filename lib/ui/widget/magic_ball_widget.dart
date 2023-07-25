import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/ui/screen/magic_ball_screen_model.dart';

//Основной виджет магического шара
class MagicBallWidget extends StatelessWidget {
  const MagicBallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(
      onPhoneShake: () =>
          Provider.of<MagicBallScreenModel>(context, listen: false)
              .changeOpacity(),
    );
    return GestureDetector(
      onTap: () => Provider.of<MagicBallScreenModel>(context, listen: false)
          .changeOpacity(),
      child: const Stack(
        children: [
          CircleAvatar(
            radius: 180,
            backgroundImage: AssetImage('images/bubble.png'),
          ),
          FadingCircle(),
          Positioned(
            bottom: 150,
            child: MagicBallAnswerText(),
          ),
        ],
      ),
    );
  }
}

// Виджет текста ответа шара
class MagicBallAnswerText extends StatelessWidget {
  const MagicBallAnswerText({super.key});

  @override
  Widget build(BuildContext context) {
    final String? text =
        Provider.of<MagicBallScreenModel>(context).answer?.toString();

    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: text != null ? 1.0 : 0.0,
        child: Container(
          padding: const EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width - 100,
          child: text != null
              ? Text(
                  text, // нужно сделать до 15 символов
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}

// Виджет затемнения шара
class FadingCircle extends StatelessWidget {
  const FadingCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final opacity = Provider.of<MagicBallScreenModel>(context).opacity;
    return SizedBox(
      height: 360,
      width: 360,
      child: AnimatedOpacity(
        onEnd: () => Provider.of<MagicBallScreenModel>(context, listen: false)
            .fetchAnswer(),
        opacity: opacity,
        duration: const Duration(milliseconds: 400),
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
