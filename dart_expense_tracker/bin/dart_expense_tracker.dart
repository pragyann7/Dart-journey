import 'dart:io';

import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/expense_service.dart';
import 'package:dart_expense_tracker/utils/input_helper.dart';

List<String> choices = [
  "Add Expenses",
  "Edit Expenses",
  "Delete Expenses",
  "List Expenses",
  "Exit",
];

var maxChoice = choices.length;
final expenseService = ExpenseService();
Future<void> main() async {
  await welcomeScreen();
  while (true) {
    int choice = homeOptions();

    switch (choice) {
      case 1:
        await addExpenseHelper(expenseService);
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        clearScreen();
        expenseService.listExpenses();
        stdout.write("Press enter to return");
        stdin.readLineSync();
        break;
      case 5:
        exit(0);
    }
  }
}

void clearScreen() {
  stdout.write("\x1B[2J\x1B[H");
}

Future<void> welcomeScreen() async {
  clearScreen();
  stdout.write('Welcome to Expense Tracker');

  for (var i = 1; i <= 3; i++) {
    stdout.write('\rWelcome to Expense Tracker${'.' * i}');
    // await Future.delayed(const Duration(seconds: 1));
  }

  stdout.writeln();
}

int homeOptions() {
  clearScreen();
  topBanner();
  print("Choose an option:");
  for (var i = 0; i < choices.length; i++) {
    print("${i + 1}. ${choices[i]}");
  }
  return readChoice("Choose: ", maxChoice);
}

void topBanner() {
  print("--Expense Tracker--\n");
}

Future<void> delay(int time) async {
  await Future.delayed(Duration(seconds: time));
}

