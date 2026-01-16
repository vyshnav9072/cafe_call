import 'package:cafe_call_app/screens/user/premium_login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EmeraldCafeApp());
}

class EmeraldCafeApp extends StatelessWidget {
  const EmeraldCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    //this si first calling when this class called
    Future.delayed(Duration(seconds: 3), () {
      // this function is called for delay the navigation to a new screen for three seconds
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PremiumLoginSceen()),
      );
    });

    super.initState();
  }


  void _startLoading() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => progress = 0.3);
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => progress = 0.6);
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => progress = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF120607),
              Color(0xFF000000),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              /// Logo Card
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFF1C0D10),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.4),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.local_cafe,
                  color: Colors.redAccent,
                  size: 42,
                ),
              ),

              const SizedBox(height: 24),

              /// Title
              const Text(
                "EMERALD",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 6),

              /// Subtitle
              const Text(
                "—  MALL CAFE  —",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  letterSpacing: 3,
                ),
              ),

              const Spacer(flex: 2),

              /// Tagline
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Your Office Fuel, ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: "Elevated",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Progress Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Stack(
                  children: [
                    // Background Track
                    Container(
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    // Progress Fill
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.35 * progress,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.redAccent.withOpacity(0.6),
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 10),

              /// Loading Text
              const Text(
                "PREPARING YOUR EXPERIENCE",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),

              const Spacer(),

              /// Footer
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                  "EMERALD MALL GROUP © 2024",
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
