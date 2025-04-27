import 'package:flutter/material.dart';
import 'package:patient_app/auths/login/login.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top half - colored
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromARGB(255, 232, 250, 247),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "SKY HEALTH",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00FFCB),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "IMPROVE YOUR LIFESTYLE",

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Striving to improve community healthcare and practices",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 4,
                        ),
                      ),
                    ),

                    SizedBox(height: 50),
                    Container(
                      child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.black,
                          ),
                          iconSize: WidgetStateProperty.all(35.0),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF00FFCB),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom half - white
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Center(child: Image.asset("images/onboarding1.png")),
            ),
          ),
        ],
      ),
    );
  }
}
