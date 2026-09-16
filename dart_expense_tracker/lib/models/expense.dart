enum ExpenseCategory {
  food,
  transport,
  shopping,
  bills,
  entertainment,
  health,
  education,
  rent,
  travel,
  other,
}

class Expense {
  String title;
  double amount;
  ExpenseCategory category;
  DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });
}
