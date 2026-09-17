import 'dart:io';

import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/expense_service.dart';
import 'package:dart_expense_tracker/utils/ui.dart';

final uiux = UiUx();

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
  uiux.topBanner();
  print("Adding Expense to the list");
  String title = readText("* Expense title: ");
  double amount = readAmount("* Amount: ");
  print("\nChoose a category:");

  for (var i = 0; i < ExpenseCategory.values.length; i++) {
    print("${i + 1}. ${ExpenseCategory.values[i].name}");
  }

  int choice = readChoice("* Category number: ", ExpenseCategory.values.length);

  ExpenseCategory category = ExpenseCategory.values[choice - 1];

  Expense expense = Expense(
    id: expenseService.getNextId(),
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
  // await uiux.delay(3);
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

void confirmationDialog(String message) {
  while (true) {
    stdout.write(message);
    final choice = (stdin.readLineSync() ?? '').trim().toLowerCase();
    if (choice == 'y' || choice == 'yes') {
      exit(0);
    } else if (choice == 'n' || choice == 'no') {
      break;
    } else {
      print("Invalid choice");
    }
  }
}

bool deleteConfirmationDialog(String message) {
  while (true) {
    stdout.write(message);
    final choice = (stdin.readLineSync() ?? '').trim().toLowerCase();

    if (choice == 'y' || choice == 'yes') {
      return true;
    } else if (choice == 'n' || choice == 'no') {
      return false;
    } else {
      print("Invalid choice");
    }
  }
}
