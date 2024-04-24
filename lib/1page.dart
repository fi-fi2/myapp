import 'package:flutter/material.dart';
import 'package:myapp/swip.dart';
import 'swip.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Lorsque l'animation est terminée, naviguer vers la page suivante
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => MyHomePage(), 
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 178, 243, 244),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            'images/LOGO.gif',
            width: 450,
            height: 450,
          ),
        ),
      ),
    );
  }
}


