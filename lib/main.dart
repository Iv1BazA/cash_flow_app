import 'package:cash_flow_app/const/model.dart';
import 'package:cash_flow_app/screens/add/add_expenses_screen.dart';
import 'package:cash_flow_app/screens/add/add_income_screen.dart';
import 'package:cash_flow_app/screens/main_screen.dart';
import 'package:cash_flow_app/screens/onboarding1.dart';
import 'package:cash_flow_app/screens/onboarding2.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FinancialProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FinancialProvider>(context, listen: false)
        .loadExpensesFromCache();
    Provider.of<FinancialProvider>(context, listen: false)
        .loadIncomesFromCache();
    ;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff111111),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/onboard2': (context) => OnBoardingWidget2(),
        '/main': (context) => MainScreenWidget(),
        '/addExp': (context) => AddExpensesWidget(),
        '/addInc': (context) => AddIncomesWidget()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  bool showInstructions = true;

  @override
  void initState() {
    super.initState();
    checkInstructionsStatus();
  }

  Future<void> checkInstructionsStatus() async {
    prefs = await SharedPreferences.getInstance();
    bool shouldShowInstructions = prefs.getBool('showInstructions') ?? true;

    if (mounted) {
      setState(() {
        showInstructions = shouldShowInstructions;
      });

      if (showInstructions) {
        await prefs.setBool('showInstructions', false);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingWidget1()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreenWidget()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
