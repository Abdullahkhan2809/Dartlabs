import 'dart:io';

void main(){
  print("enter your age : ");
  try{
    int age=int.parse(stdin.readLineSync()!);



    if (age < 0) {
      print("Age cannot be negative.");
    } else if (age > 100) {
      print("You are already over 100 years old!");
    } else {
      print("You have ${100 - age} years left until 100.");
    }
  }
  catch(error){
    print("enter valid input..");
  }
}