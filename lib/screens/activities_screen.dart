import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:cash_flow_app/screens/widgets/barchart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivitiesWidget extends StatefulWidget {
  const ActivitiesWidget({super.key});

  @override
  State<ActivitiesWidget> createState() => _ActivitiesWidgetState();
}

class _ActivitiesWidgetState extends State<ActivitiesWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 90,
          color: primary,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Activites',
                  style: discription.copyWith(color: Colors.white),
                ),
              )),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: grey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                    height: 230,
                    child: BarChartPage(selectedRange: currentIndex)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: grey),
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex != 0) {
                                    currentIndex = 0;
                                  }
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: currentIndex == 0
                                          ? primary
                                          : Colors.transparent),
                                  child: Center(
                                      child: Text('Today',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: currentIndex == 0
                                                  ? Colors.white
                                                  : opacity)))),
                            )),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex != 1) {
                                    currentIndex = 1;
                                  }
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: currentIndex == 1
                                          ? primary
                                          : Colors.transparent),
                                  child: Center(
                                      child: Text('Week',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: currentIndex == 1
                                                  ? Colors.white
                                                  : opacity)))),
                            )),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentIndex != 2) {
                                    currentIndex = 2;
                                  }
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: currentIndex == 2
                                          ? primary
                                          : Colors.transparent),
                                  child: Center(
                                      child: Text('Month',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: currentIndex == 2
                                                  ? Colors.white
                                                  : opacity)))),
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Consumer<FinancialProvider>(builder: ((context, provider, child) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: grey),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), color: grey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total amount',
                            style: discription,
                          ),
                          Text(
                            '${provider.balance} \$',
                            style: discription.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), color: grey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Income',
                                style: discription,
                              ),
                              Text(
                                '${provider.totalIncomes} \$',
                                style:
                                    discription.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                              width: double.infinity, height: 1, color: grey),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Expenses',
                                style: discription,
                              ),
                              Text(
                                '-${provider.totalExpenses} \$',
                                style:
                                    discription.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }))
      ],
    );
  }
}
