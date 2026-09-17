import 'dart:io';
import 'dart:convert';

import 'package:dart_expense_tracker/models/expense.dart';

class StorageService {
    File file = File("lib/data/expenses.json");
  void save(List<Expense> expenses) {
    final data = expenses
        .map(
          (expense) => expense.toJson())
        .toList();

    file.writeAsStringSync(jsonEncode(data));
  }


  List<Expense> loadExpenses(){
    if (!file.existsSync()) {
      return [];
    }

    String jsonText = file.readAsStringSync();

    if (jsonText.trim().isEmpty) {
      return [];
    }

    List<dynamic> decodedData = jsonDecode(jsonText);

    return decodedData.map((item) => Expense.fromJson(item)).toList();
  }


}