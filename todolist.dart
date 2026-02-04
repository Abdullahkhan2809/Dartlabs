import 'dart:io';
//Abdullah Khan 514779
class Todo{
  List<String> task= [];

  //add task

  void addTask(){
    print("Enter the task");
    String? tasktowrite= stdin.readLineSync();
   if(tasktowrite!=null && tasktowrite.isNotEmpty){
    task.add(tasktowrite.trim());
    print("Task added");

   }
   else{
    print("not Added");
   } 
  }

  //remove the task as per their index

  void removeTask(){
    print("Enter The number of Task: ");
    int? index=int.parse(stdin.readLineSync()!);
    if(index>0 && index<task.length){
    task.removeAt(index);
    print("task removed at $index");
    }
    else{
      print("Invalid input");
    }
  }

  //show task

  void readtask(){
    print("-----TODO LIST-----");

    
    if (task.isEmpty) {
      print("No tasks available.");
      return;
    }

    for(int i=0; i<task.length; i++){
      print("${i+1}. ${task[i]}");
    }
  }
}
void main(){
    Todo t1= Todo();
    int choice=0;
    while(choice!=4){
    print("\n1. Add Task");
    print("2. Remove Task");
    print("3. View Tasks");
    print("4. Exit");
    print("Enter your choice:");
    
    choice=int.parse(stdin.readLineSync()!);

     switch (choice) {
      case 1:
        t1.addTask();
        break;
      case 2:
        t1.removeTask();
        break;
      case 3:
        t1.readtask();
        break;
      case 4:
        print("Goodbye!");
        break;
      default:
        print("Invalid choice");
     }
    }
}