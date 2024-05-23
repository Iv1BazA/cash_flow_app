import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Expense {
  final String title;
  final int amount;
  final String type;
  final String icon;
  final DateTime date;
  bool income = false;

  Expense({
    required this.title,
    required this.amount,
    required this.type,
    required this.icon,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'amount': amount,
        'type': type,
        'icon': icon,
        'date': date.toIso8601String(),
      };

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        title: json['title'],
        amount: json['amount'],
        type: json['type'],
        icon: json['icon'],
        date: DateTime.parse(json['date']),
      );
}

class Income {
  final String title;
  final int amount;
  final String type;
  final String icon;
  final DateTime date;
  bool income = true;

  Income({
    required this.title,
    required this.amount,
    required this.type,
    required this.icon,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'amount': amount,
        'type': type,
        'icon': icon,
        'date': date.toIso8601String(),
      };

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        title: json['title'],
        amount: json['amount'],
        type: json['type'],
        icon: json['icon'],
        date: DateTime.parse(json['date']),
      );
}

class FinancialProvider with ChangeNotifier {
  List<Expense> _expensesList = [];
  List<Income> _incomesList = [];

  List<Expense> get expenses => _expensesList;
  List<Income> get incomes => _incomesList;

  void addExpense(Expense expense) {
    _expensesList.add(expense);
    _saveExpensesToCache();
    notifyListeners();
  }

  void addIncome(Income income) {
    _incomesList.add(income);
    _saveIncomesToCache();
    notifyListeners();
  }

  Future<void> loadExpensesFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final String? expensesJson = prefs.getString('expenses');
    if (expensesJson != null) {
      final List<dynamic> expenseList = jsonDecode(expensesJson);
      _expensesList = expenseList.map((e) => Expense.fromJson(e)).toList();
      notifyListeners();
    }
  }

  Future<void> loadIncomesFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final String? incomesJson = prefs.getString('incomes');
    if (incomesJson != null) {
      final List<dynamic> incomeList = jsonDecode(incomesJson);
      _incomesList = incomeList.map((e) => Income.fromJson(e)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveExpensesToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final String expensesJson =
        jsonEncode(_expensesList.map((e) => e.toJson()).toList());
    await prefs.setString('expenses', expensesJson);
  }

  Future<void> _saveIncomesToCache() async {
    final prefs = await SharedPreferences.getInstance();
    final String incomesJson =
        jsonEncode(_incomesList.map((e) => e.toJson()).toList());
    await prefs.setString('incomes', incomesJson);
  }

  int get totalExpenses =>
      _expensesList.fold(0, (sum, item) => sum + item.amount);
  int get totalIncomes =>
      _incomesList.fold(0, (sum, item) => sum + item.amount);
  int get balance => totalIncomes - totalExpenses;
}
