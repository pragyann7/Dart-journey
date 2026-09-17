import 'dart:io';

class UiUx{
  void topBanner() {
    clearScreen();
  print("--Expense Tracker--\n");
}

Future<void> delay(int time) async {
  await Future.delayed(Duration(seconds: time));
}

void clearScreen() {
  stdout.write("\x1B[2J\x1B[H");
}
}