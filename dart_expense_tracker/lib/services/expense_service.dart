import 'dart:io';

import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/storage_service.dart';

class ExpenseService {
  List<Expense> expenses = [];
  StorageService storageService = StorageService();

  int getNextId() {
    if (expenses.isEmpty) {
      return 101;
    }

    int largestId = 0;

    for (Expense expense in expenses) {
      if (expense.id > largestId) {
        largestId = expense.id;
      }
    }

    return largestId + 1;
  }

  void loadExpenses(List<Expense> savedExpenses) {
    expenses.clear();
    expenses.addAll(savedExpenses);
  }

  void addExpense(Expense expense) {
    expenses.add(expense);
    storageService.save(expenses);
  }

  void listExpenses() {
    print("Expenses List:-");
    print("| SN | ID | Title | Amount | Category | Date |");
    int i = 1;
    for (var expense in expenses) {
      print(
        "| $i. | ${expense.id} | ${expense.title} | ${expense.amount} | ${expense.category.name} | ${expense.date} |",
      );
      i++;
    }
    print("------------------------");
    print("Total: ${getTotal() == 0 ? "No entries" : getTotal()}        |");
    print("------------------------");
  }

  double getTotal() {
    double total = 0;
    for (Expense expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  Expense? findExpenseById(int id) {
    for (final expense in expenses) {
      if (expense.id == id) {
        return expense;
      }
    }

    return null;
  }

  bool editExpense(int id, Expense updatedExpense) {
    int index = expenses.indexWhere((expense) => expense.id == id);

    if (index == -1) {
      return false;
    }

    expenses[index] = updatedExpense;
    return true;
  }

  bool deleteExpense(int id) {
  int index = expenses.indexWhere(
    (expense) => expense.id == id,
  );

  if (index == -1) {
    return false;
  }

  expenses.removeAt(index);
  return true;
}
}
