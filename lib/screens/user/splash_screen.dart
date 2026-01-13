import 'package:cafe_call_app/screens/user/premium_login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Center Content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// Logo Box
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFF132F4C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.coffee,
                        color: Colors.red ,
                        size: 40,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// App Name
                    const Text(
                      "EMERALD",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),

                    const SizedBox(height: 4),

                    /// Subtitle
                    const Text(
                      "MALL CAFE",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),

              /// Bottom Section
              Column(
                children: [

                  /// Tagline
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Your Office Fuel, ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        TextSpan(
                          text: "Elevated",
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Progress Bar
                  Container(
                    width: 140,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 70,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Loading Text
                  const Text(
                    "PREPARING YOUR EXPERIENCE",
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 10,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// Footer
                  const Text(
                    "EMERALD MALL GROUP © 2024",
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 10,
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

