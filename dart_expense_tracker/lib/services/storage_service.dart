import 'dart:io';
import 'dart:convert';

import 'package:dart_expense_tracker/models/expense.dart';

class StorageService {
  void save(List<Expense> expenses) {
    File file = File("lib/data/expenses.json");
    final data = expenses
        .map(
          (expense) => {
            "title": expense.title,
            "amount": expense.amount,
            "category": expense.category.name,
            "date": expense.date.toIso8601String(),
          },
        )
        .toList();

    file.writeAsStringSync(jsonEncode(data));
  }
}