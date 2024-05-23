import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_images.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingWidget1 extends StatelessWidget {
  const OnBoardingWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CashFlow',
              style: primarytxt,
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to your \npersonalized finance app!',
              style: bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
                'This app will become your indispensable \nassistant in managing your personal finances.',
                textAlign: TextAlign.center,
                style: discription),
            SizedBox(height: 50),
            Image.asset(onboard1, width: 200, height: 200),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/onboard2');
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: btnstyle,
                child: Center(
                  child: Text(
                    'Next',
                    style: discription.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
