import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_icons.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BalanceWidg extends StatelessWidget {
  const BalanceWidg({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialProvider>(builder: (context, provider, child) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16), top: Radius.zero)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text('Your balance', style: discription),
              SizedBox(height: 10),
              Text('${provider.balance}\$', style: bold.copyWith(fontSize: 32)),
              SizedBox(height: 15),
              Row(children: [
                Expanded(
                    child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(0.08)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Income',
                                style: discription.copyWith(fontSize: 14)),
                            Row(children: [
                              SvgPicture.asset(graph),
                              SizedBox(width: 3),
                              Text('${provider.totalIncomes}\$',
                                  style:
                                      discription.copyWith(color: Colors.white))
                            ])
                          ])),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(0.08)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Expenses',
                                style: discription.copyWith(fontSize: 14)),
                            Row(children: [
                              SvgPicture.asset(graph),
                              SizedBox(width: 3),
                              Text('${provider.totalExpenses}\$',
                                  style:
                                      discription.copyWith(color: Colors.white))
                            ])
                          ])),
                )),
              ]),
              SizedBox(height: 25),
            ],
          ),
        ),
      );
    });
  }
}
