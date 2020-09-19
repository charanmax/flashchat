import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/buttons.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/asfalt-dark.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo-1.png',
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  TypewriterAnimatedTextKit(
                    alignment: Alignment.center,
                    text: ['Anurag University'],
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              Button(
                text: 'Login',
                color: Colors.lightBlueAccent,
                onpress: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              Button(
                text: 'Register',
                color: Colors.blueAccent,
                onpress: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//() {
//Navigator.pushNamed(context, LoginScreen.id);
//},
