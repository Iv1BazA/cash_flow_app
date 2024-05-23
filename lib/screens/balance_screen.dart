import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_icons.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:cash_flow_app/screens/add/add_expenses_screen.dart';
import 'package:cash_flow_app/screens/add/add_income_screen.dart';
import 'package:cash_flow_app/screens/widgets/balance_widget.dart';
import 'package:cash_flow_app/screens/widgets/finance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key});

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BalanceWidg(),
        SizedBox(height: 15),
        const ButtonAddWidget(),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: grey, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'History',
                    style: discription,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16), color: grey),
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
                                    child: Text('All',
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
                                    child: Text('Income',
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
                                    child: Text('Expenses',
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
              SizedBox(height: 15),
              // const NoInfo(),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Consumer<FinancialProvider>(
                  builder: (context, provider, child) {
                    return MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: currentIndex == 2
                            ? const Expens()
                            : currentIndex == 1
                                ? const Incms()
                                : const CombinedList());
                  },
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(color: grey, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(voskl, width: 20, height: 20),
                SizedBox(width: 10),
                Text('Your balance is empty.',
                    style: discription.copyWith(color: Colors.white)),
              ],
            ),
            SizedBox(height: 10),
            Text(
                'To add income or expenses, tap to the \n“Refill Balance“ button.',
                style: discription)
          ],
        ),
      ),
    );
  }
}

class ButtonAddWidget extends StatelessWidget {
  void _showChoiceModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('What you want to add?'),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Add Expense'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AddExpensesWidget(),
                  ),
                );
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Add Income'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => AddIncomesWidget(),
                  ),
                );
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  const ButtonAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showChoiceModal(context),
      child: Container(
        height: 80,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), color: grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(16)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(CupertinoIcons.add, color: primary),
              SizedBox(width: 5),
              Text(
                'Refill Balance',
                style: discription.copyWith(color: Colors.white),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
