import 'dart:async';

Future<String> FetchUserdata() async{

  await Future.delayed(Duration(seconds:3 ));

  return " User Data loaded";
}
void main() async {
    print(" Fetching whether data....");

    try{
      String whetherdata=await FetchUserdata();

      print(" fetching user data");
      print(whetherdata);
      print("User data.");
    } catch (error){
      print("Error Occurred : $error");
    }
    
}