import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 2.5 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.cover,
          ),
          Container(color: darkColor.withOpacity(0.66)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FlutterI18n.translate(context, "Welcome to my universe of code!"),
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) : TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(height: defaultPadding / 2),
                MyBuildAnimatedText(),
                SizedBox(height: defaultPadding),
                if (!Responsive.isMobileLarge(context))
                  ElevatedButton(
                    onPressed: () async {
                      final Uri params = Uri(
                        scheme: 'mailto',
                        path: 'gabriel.fraga@pawaresoftwares.com.br',
                        query: 'subject=Contact&body=Hello Gabriel Fraga!',
                      );

                      var url = params.toString();
                      if (await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url));
                      } else {
                      print('Could not launch $url');
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2,
                          vertical: defaultPadding),
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      FlutterI18n.translate(context, "Contact me"),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 140,
              height: 70,
              margin: EdgeInsets.only(top: defaultPadding),
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse('https://www.linkedin.com/in/gabriel-fraga-9657a0207/'),
                          mode: LaunchMode.externalApplication,
                      );
                    },
                    icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                  ),
                  IconButton(
                    onPressed: () async {
                      await launchUrl(
                          Uri.parse('https://github.com/GabrielFragaM'),
                          mode: LaunchMode.externalApplication,
                      );
                    },
                    icon: SvgPicture.asset("assets/icons/github.svg"),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1!,
      maxLines: 1,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
          if (!Responsive.isMobileLarge(context))
            SizedBox(width: defaultPadding / 2),
          Text(FlutterI18n.translate(context, "Development "), style: TextStyle(fontSize:  !Responsive.isMobileLarge(context) ? 16 : 11),),
          Responsive.isMobile(context)
              ? Expanded(child: AnimatedText())
              : AnimatedText(),
          if (!Responsive.isMobileLarge(context))
            SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context)) FlutterCodedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
            FlutterI18n.translate(context, "of complex applications"),
          speed: Duration(milliseconds: 60),
          textStyle: TextStyle(fontSize: !Responsive.isMobileLarge(context) ? 16 : 11)
        ),
        TyperAnimatedText(
            FlutterI18n.translate(context, "of multilingual systems such as Japanese, English"),
          speed: Duration(milliseconds: 60),
            textStyle: TextStyle(fontSize: !Responsive.isMobileLarge(context) ? 16 : 11)
        ),
        TyperAnimatedText(
          FlutterI18n.translate(context, "of web iOS and Android platforms"),
          speed: Duration(milliseconds: 60),
            textStyle: TextStyle(fontSize: !Responsive.isMobileLarge(context) ? 16 : 11)
        ),
      ],
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "dev",
            style: TextStyle(color: Colors.red, fontSize: !Responsive.isMobileLarge(context) ? 16 : 11),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
