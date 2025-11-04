import 'package:flutter/material.dart';
import 'animais_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _moveDownAnimation;

  @override
  void initState() {
    super.initState();

    //  5s
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

   
    _moveDownAnimation = Tween<double>(begin: -1000.0, end: 0.0)
        .chain(CurveTween(curve: Curves.easeOutCubic))
        .animate(_controller);


    
    _controller.forward();

   
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AnimaisScreen()),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fundo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          
          AnimatedBuilder(
            animation: _moveDownAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _moveDownAnimation.value),
                child: child,
              );
            },
            child: Center(
              

              //logo
              child: Image.asset(
                'assets/images/logo.png',
                width: 700,
                height: 700,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
