import 'package:cash_flow_app/const/app_colors.dart';
import 'package:cash_flow_app/const/app_styles.dart';
import 'package:cash_flow_app/const/category.dart';
import 'package:cash_flow_app/const/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AddIncomesWidget extends StatefulWidget {
  const AddIncomesWidget({super.key});

  @override
  State<AddIncomesWidget> createState() => _AddIncomesWidgetState();
}

class _AddIncomesWidgetState extends State<AddIncomesWidget> {
  final title = TextEditingController();
  final amount = TextEditingController();
  int currentIndex = -1;
  String type = '';
  String icon = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Incomes',
            style: discription.copyWith(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: grey),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Title', style: discription),
              SizedBox(height: 5),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: title,
                style: discription.copyWith(color: Colors.white),
                cursorColor: Colors.white,
                decoration: textfieldstyle.copyWith(hintText: 'Name title'),
              ),
              SizedBox(height: 10),
              Text('Amount', style: discription),
              SizedBox(height: 5),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: amount,
                keyboardType: TextInputType.number,
                style: discription.copyWith(color: Colors.white),
                cursorColor: Colors.white,
                decoration: textfieldstyle.copyWith(hintText: 'Amount'),
              ),
              SizedBox(height: 25),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                            type = listinc[index].name;
                            icon = listinc[index].icon;
                          });
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? primary.withOpacity(0.14)
                                  : grey,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    '${listinc[index].icon}',
                                    color: currentIndex == index
                                        ? primary
                                        : opacity,
                                  ),
                                  SizedBox(width: 10),
                                  Text('${listinc[index].name}',
                                      style: discription.copyWith(
                                          color: currentIndex == index
                                              ? primary
                                              : grey)),
                                  Spacer(),
                                  currentIndex == index
                                      ? SvgPicture.asset(
                                          'assets/Icons/accsess.svg',
                                        )
                                      : Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: grey),
                                        )
                                ],
                              )),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: listinc.length),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: title.text.isNotEmpty &&
                        amount.text.isNotEmpty &&
                        type != ''
                    ? () {
                        final Income income = Income(
                            title: title.text,
                            amount: int.parse(amount.text),
                            type: type,
                            icon: icon,
                            date: DateTime.now());
                        final itemProvider = Provider.of<FinancialProvider>(
                            context,
                            listen: false);
                        itemProvider.addIncome(income);
                        Navigator.of(context).pushReplacementNamed('/main');
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: title.text.isNotEmpty &&
                              amount.text.isNotEmpty &&
                              type != ''
                          ? primary
                          : primary.withOpacity(0.4)),
                  child: Center(
                    child: Text('Add Income',
                        style: discription.copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
