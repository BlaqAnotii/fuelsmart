library custom_splash;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/resources/colors.dart';
import 'package:flutter_template/services/navigation_service.dart';
import 'package:flutter_template/views/startup/landing_view.dart';
import 'package:go_router/go_router.dart';

Widget? _home;
Function? _customFunction;
String? _imagePath;
int? _duration;
SplashType? _runfor;
Color? _backGroundColor;
String? _animationEffect;
double? _logoSize;

enum SplashType { StaticDuration, BackgroundProcess }

Map<int, Widget> _outputAndHome = {0: const LandingView()};

class Splash extends StatefulWidget {
  Splash(
      {@required String? imagePath,
      @required Widget? home,
      Function? customFunction,
      int? duration,
      SplashType? type,
      Color backGroundColor = Colors.white,
      String animationEffect = 'fade-in',
      double logoSize = 250.0,
      Map<int, Widget>? outputAndHome}) {
    assert(duration != null);
    assert(home != null);
    assert(imagePath != null);

    _home = home;
    _duration = duration;
    _customFunction = customFunction;
    _imagePath = imagePath;
    _runfor = type;
    _outputAndHome = outputAndHome!;
    _backGroundColor = backGroundColor;
    _animationEffect = animationEffect;
    _logoSize = 250.0;
  }

  @override
  _CustomSplashState createState() => _CustomSplashState();
}

class _CustomSplashState extends State<Splash>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    print("initState ==== @ Splash");
    if (_duration! < 1000) _duration = 2000;
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController!, curve: Curves.easeInCirc));
    _animationController!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.reset();
  }

  navigator(home) {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (BuildContext context) => home));
  }

  Widget _buildAnimation() {
    Widget? x;
    switch (_animationEffect) {
      case 'fade-in':
        {
          x = FadeTransition(
              opacity: _animation!,
              child: Center(
                  child: SizedBox(
                      height: _logoSize, child: Image.asset(_imagePath!))));
        }
        break;
      case 'zoom-in':
        {
          x = ScaleTransition(
              scale: _animation!,
              child: Center(
                  child: SizedBox(
                      height: _logoSize, child: Image.asset(_imagePath!))));
        }
        break;
      case 'zoom-out':
        {
          x = ScaleTransition(
              scale: Tween(begin: 1.5, end: 0.6).animate(CurvedAnimation(
                  parent: _animationController!, curve: Curves.easeInCirc)),
              child: Center(
                  child: SizedBox(
                      height: _logoSize, child: Image.asset(_imagePath!))));
        }
        break;
      case 'top-down':
        {
          x = SizeTransition(
              sizeFactor: _animation!,
              child: Center(
                  child: SizedBox(
                      height: _logoSize, child: Image.asset(_imagePath!))));
        }
        break;
    }
    return x!;
  }

  @override
  Widget build(BuildContext context) {
    _runfor == SplashType.BackgroundProcess
        ? Future.delayed(Duration.zero).then((value) async {
            print("prewait-------");

            var res = await _customFunction!();
            print("res: " + res.toString());
            //print("$res+${_outputAndHome[res]}");

            Future.delayed(Duration(milliseconds: _duration!)).then((value) {
              navigationService.pushAndReplace(_outputAndHome[res]);
            });
          })
        : Future.delayed(Duration(milliseconds: _duration!)).then((value) {
            navigationService.pushAndReplace(_home);
          });

    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 52,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: _backGroundColor,
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
            color: AppColors.white,
          )),
          _buildAnimation()
        ]));
  }
}
