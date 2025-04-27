import 'package:flutter/material.dart';
import 'package:patient_app/onboarding/onboarding2.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 150),
            Image.asset("images/onboarding1.png"),
            SizedBox(height: 50),
            Text(
              "IMPROVE YOUR LIFESTYLE",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),

              child: Center(
                child: Text(
                  "Striving to improve community healthcare and practices",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding2()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward, color: Color(0xFF00FFCB)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
