import 'dart:async';

Future<String> fetchWhetherData() async{

  await Future.delayed(Duration(seconds:3 ));

  return " City : Quetta\nTemperature : 10`C\nSunny.";
}
void main() async {
    print(" Fetching whether data....");

    try{
      String whetherdata=await fetchWhetherData();

      print("Whether data received: ");
      print(whetherdata);
      print("Whether Data.");
    } catch (error){
      print("Error Occurred : $error");
    }
    
}