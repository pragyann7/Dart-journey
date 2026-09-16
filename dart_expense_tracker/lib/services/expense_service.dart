import 'package:dart_expense_tracker/models/expense.dart';
import 'package:dart_expense_tracker/services/storage_service.dart';

class ExpenseService {
  List<Expense> expenses = [];
  StorageService storageService = StorageService();

  void addExpense(Expense expense) {
    expenses.add(expense);
    storageService.save(expenses);
  }

  void listExpenses() {
    print("| SN | Title | Amount | Category | Date |");
    int i = 1;
    for (var expense in expenses) {
      print(
        "| $i. | ${expense.title} | ${expense.amount} | ${expense.category.name} | ${expense.date} |",
      );
      i++;
    }
    print("-----------------------");
    print("Total: ${getTotal() == 0 ? "No entries" : getTotal()}");
  }

  double getTotal() {
    double total = 0;
    for (Expense expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
