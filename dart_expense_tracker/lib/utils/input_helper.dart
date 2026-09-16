import 'dart:io';

import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/expense_service.dart';

int readChoice(String message, int maxChoice) {
  while (true) {
    stdout.write(message);
    int? choice = int.tryParse(stdin.readLineSync() ?? "");

    if (choice != null && choice >= 1 && choice <= maxChoice) {
      return choice;
    }
    print("Enter a number from 1 to $maxChoice.");
  }
}

Future<void> addExpenseHelper(ExpenseService expenseService) async {
  String title = readText("Expense title: ");
  double amount = readAmount("Amount: ");
  print("\nChoose a category:");

  for (var i = 0; i < ExpenseCategory.values.length; i++) {
    print("${i + 1}. ${ExpenseCategory.values[i].name}");
  }

  int choice = readChoice("Category number: ", ExpenseCategory.values.length);

  ExpenseCategory category = ExpenseCategory.values[choice - 1];

  Expense expense = Expense(
    title: title,
    amount: amount,
    category: category,
    date: DateTime.now(),
  );

  expenseService.addExpense(expense);
  //for debuggin
  print(title);
  print(amount);
  print(category.name);
  print("Expense adeed successfully.");
  await delay(3);
}

String readText(String message) {
  stdout.write(message);
  return stdin.readLineSync() ?? '';
}

double readAmount(String message) {
  while (true) {
    stdout.write(message);
    double? amount = double.tryParse(stdin.readLineSync() ?? '');

    if (amount != null && amount > 0) {
      return amount;
    }

    print('Please enter a valid amount greater than 0.');
  }
}

Future<void> delay(int time) async {
  await Future.delayed(Duration(seconds: time));
}
