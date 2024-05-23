import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Expens extends StatefulWidget {
  const Expens({super.key});

  @override
  State<Expens> createState() => _ExpensState();
}

class _ExpensState extends State<Expens> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final income = provider.expenses[index];
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        child: Center(
                          child: SvgPicture.asset(
                            income.icon,
                            width: 24,
                            height: 24,
                            color: primary,
                          ),
                        ),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: grey),
                      ),
                      SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${income.title}',
                              style: discription.copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '${income.type}',
                              style: discription.copyWith(fontSize: 14),
                            ),
                          ]),
                      Spacer(),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '-${income.amount}\$',
                              style: discription.copyWith(color: primary),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Expenses',
                              style: discription.copyWith(fontSize: 14),
                            ),
                          ])
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: provider.expenses.length);
      },
    );
  }
}

class Incms extends StatefulWidget {
  const Incms({super.key});

  @override
  State<Incms> createState() => _IncmsState();
}

class _IncmsState extends State<Incms> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final income = provider.incomes[index];
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        child: Center(
                          child: SvgPicture.asset(
                            income.icon,
                            width: 24,
                            height: 24,
                            color: primary,
                          ),
                        ),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: grey),
                      ),
                      SizedBox(width: 15),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${income.title}',
                              style: discription.copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '${income.type}',
                              style: discription.copyWith(fontSize: 14),
                            ),
                          ]),
                      Spacer(),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '+${income.amount}\$',
                              style: discription.copyWith(color: primary),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Incomes',
                              style: discription.copyWith(fontSize: 14),
                            ),
                          ])
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: provider.incomes.length);
      },
    );
  }
}

class CombinedList extends StatefulWidget {
  const CombinedList({Key? key}) : super(key: key);

  @override
  _CombinedListState createState() => _CombinedListState();
}

class _CombinedListState extends State<CombinedList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialProvider>(
      builder: (context, provider, child) {
        List<dynamic> combinedList = [
          ...provider.expenses,
          ...provider.incomes
        ];
        combinedList.sort((a, b) => b.date.compareTo(a.date)); // Sort by date

        return ListView.separated(
          itemBuilder: (context, index) {
            final item = combinedList[index];
            return Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      child: Center(
                        child: SvgPicture.asset(
                          item.icon,
                          width: 24,
                          height: 24,
                          color: primary,
                        ),
                      ),
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: grey,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.title}',
                          style: discription.copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${item.type}',
                          style: discription.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${item.income == true ? '+' : '-'}${item.amount}\$',
                          style: discription.copyWith(color: primary),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${item.income == true ? 'Income' : 'Expense'}',
                          style: discription.copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: combinedList.length,
        );
      },
    );
  }
}
