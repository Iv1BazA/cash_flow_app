class Expenses {
  final String icon;
  final String name;

  Expenses({required this.icon, required this.name});
}

List<Expenses> listexp = [
  Expenses(icon: 'assets/Icons/Expenses/1.svg', name: 'Procurement'),
  Expenses(icon: 'assets/Icons/Expenses/2.svg', name: 'Food'),
  Expenses(icon: 'assets/Icons/Expenses/3.svg', name: 'Transport'),
  Expenses(icon: 'assets/Icons/Expenses/4.svg', name: 'Rest'),
  Expenses(icon: 'assets/Icons/Expenses/5.svg', name: 'Investment')
];

class Incomes {
  final String icon;
  final String name;

  Incomes({required this.icon, required this.name});
}

List<Incomes> listinc = [
  Incomes(icon: 'assets/Icons/Incomes/1.svg', name: 'Business'),
  Incomes(icon: 'assets/Icons/Incomes/2.svg', name: 'Salary'),
  Incomes(icon: 'assets/Icons/Incomes/3.svg', name: 'Freelance'),
  Incomes(icon: 'assets/Icons/Incomes/4.svg', name: 'Dividends'),
  Incomes(icon: 'assets/Icons/Incomes/5.svg', name: 'Investment'),
  Incomes(icon: 'assets/Icons/Incomes/6.svg', name: 'Rent'),
  Incomes(icon: 'assets/Icons/Incomes/7.svg', name: 'Royalty'),
  Incomes(icon: 'assets/Icons/Incomes/8.svg', name: 'Passive income')
];
