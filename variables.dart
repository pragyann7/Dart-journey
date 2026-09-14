import 'dart:io';

void main(){
  // var name;
  // stdout.write("Enter your name: ");
  // name = stdin.readLineSync();
  // var city = stdin.readLineSync();
  // if (city == "") {
  //   city = "Unknown";    
  // }
  // var age = int.parse(stdin.readLineSync()!);
  // print("Hello $name you are from $city Your age is $age");

  String name;
  int age;
  bool isLoggedIn;
  double salary;

  name = "pragyan";
  age = 24;
  isLoggedIn = true;
  salary = 200000;
  print("$name ${name.runtimeType}");
  print("$age ${age.runtimeType}");
  print(isLoggedIn);
  print("$salary ${salary.runtimeType}");

  var qwerty = true;
  print(qwerty.runtimeType);

}