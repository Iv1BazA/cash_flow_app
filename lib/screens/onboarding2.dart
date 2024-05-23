import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_images.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingWidget2 extends StatelessWidget {
  const OnBoardingWidget2({super.key});

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
              'Your personal financial \nassistant in your pocket.',
              style: bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
                'In our app, you can easily track expenses and \nincome, keep a budget, and plan savings.',
                textAlign: TextAlign.center,
                style: discription),
            SizedBox(height: 50),
            Image.asset(onboard2, width: 200, height: 200),
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/main');
              },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: btnstyle,
                child: Center(
                  child: Text(
                    'Get started',
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
