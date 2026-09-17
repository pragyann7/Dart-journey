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
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    final rawId = json['id'];

    return Expense(
      id: rawId.toInt(),
      title: json['title'],
      amount: (json['amount'] as num).toDouble(),
      category: ExpenseCategory.values.byName(json['category']),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "category": category.name,
      "date": date.toIso8601String(),
    };
  }
}
