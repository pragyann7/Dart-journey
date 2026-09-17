import 'dart:io';

import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/expense_service.dart';
import 'package:dart_expense_tracker/services/storage_service.dart';
import 'package:dart_expense_tracker/utils/input_helper.dart';
import 'package:dart_expense_tracker/utils/ui.dart';

List<String> choices = [
  "Add Expenses",
  "Edit Expenses",
  "Delete Expenses",
  "List Expenses",
  "Exit",
];

var maxChoice = choices.length;
final uiux = UiUx();
final expenseService = ExpenseService();
final storageService = StorageService();
Future<void> main() async {
  //main starting point

  List<Expense> savedExpenses = storageService.loadExpenses();
  expenseService.loadExpenses(savedExpenses);

  await welcomeScreen();
  while (true) {
    int choice = homeOptions();

    switch (choice) {
      case 1:
        await addExpenseHelper(expenseService);
        break;
      case 2:
        editExpenseOption();
        break;
      case 3:
        deleteExpenseOption();
        break;
      case 4:
        showExpenseList();
        break;
      case 5:
        confirmationDialog("You want to exit?(y/n): ");
    }
  }
}

Future<void> welcomeScreen() async {
  uiux.clearScreen();
  stdout.write('Welcome to Expense Tracker');

  for (var i = 1; i <= 3; i++) {
    stdout.write('\rWelcome to Expense Tracker${'.' * i}');
    // await Future.delayed(const Duration(seconds: 1));
  }

  stdout.writeln();
}

int homeOptions() {
  uiux.clearScreen();
  uiux.topBanner();
  print("Choose an option:");
  for (var i = 0; i < choices.length; i++) {
    print("${i + 1}. ${choices[i]}");
  }
  print("-------------------");
  return readChoice("Choose: ", maxChoice);
}

void showExpenseList() {
  uiux.clearScreen();
  uiux.topBanner();
  expenseService.listExpenses();
  stdout.write("Press enter to return");
  stdin.readLineSync();
}

void editExpenseOption() {
  uiux.topBanner();
  String id = readText("Enter expense id: ");
  final expenseId = int.tryParse(id);

  if (expenseId == null) {
    print('Please enter a valid expense ID.');
    stdin.readLineSync();
    return;
  }

  final oldExpense = expenseService.findExpenseById(expenseId);

  if (oldExpense == null) {
    print('No expense found with ID $expenseId.');
    stdout.write("\nPress enter to go back");
    stdin.readLineSync();
    return;
  }

  print(
    "\nID: ${oldExpense.id}\nTitle: ${oldExpense.title}\nAmount: ${oldExpense.amount}\nCategory: ${oldExpense.category.name}\nDate: ${oldExpense.date}",
  );

  String newTitle = readText("\nNew title: ");
  double newAmount = readAmount("New amount: ");
  print("\nChoose a category:");

  for (var i = 0; i < ExpenseCategory.values.length; i++) {
    print("${i + 1}. ${ExpenseCategory.values[i].name}");
  }

  int choice = readChoice("* Category number: ", ExpenseCategory.values.length);
  ExpenseCategory newCategory = ExpenseCategory.values[choice - 1];

  final updatedExpense = Expense(
    id: oldExpense.id,
    title: newTitle,
    amount: newAmount,
    category: newCategory,
    date: oldExpense.date,
  );

  expenseService.editExpense(expenseId, updatedExpense);
  storageService.save(expenseService.expenses);
  uiux.topBanner();
  print("Expense updated successfully.\n");
  print(
    "\nID: ${oldExpense.id}\nTitle: $newTitle\nAmount: $newAmount\nCategory: ${newCategory.name}\nDate: ${oldExpense.date}",
  );
  stdout.write("\nPress enter to go back");
  stdin.readLineSync();
}

void deleteExpenseOption() {
  uiux.topBanner();
  String id = readText("Enter expense id: ");
  final expenseId = int.tryParse(id);
  if (expenseId == null) {
    print('Please enter a valid expense ID.');
    stdin.readLineSync();
    return;
  }

  final expense = expenseService.findExpenseById(expenseId);

  if (expense == null) {
    print('No expense found with ID $expenseId.');
    stdout.write("\nPress enter to go back");
    stdin.readLineSync();
    return;
  }

  print(
    "\nID: ${expense.id}\nTitle: ${expense.title}\nAmount: ${expense.amount}\nCategory: ${expense.category.name}\nDate: ${expense.date}",
  );

  bool deleteChoice = deleteConfirmationDialog(
    "\nAre you sure you want to delete it?(y/n): ",
  );

  if (deleteChoice) {
    expenseService.deleteExpense(expenseId);
    storageService.save(expenseService.expenses);
    uiux.topBanner();
    print("Expense deleted successfully");
  } else {
    print("expense not found.");
  }

  stdout.write("\nPress enter to go back");
  stdin.readLineSync();
}
