import 'dart:io';
//Abdullah Khan 514779
abstract class RideType{
   calculate(double distance);

}

//bike ride calculation
class bikeRide extends RideType{
   @override
   double calculate(double distance)=>distance*10;
}


//car ride calculation
class carRide extends RideType{
    @override
    double calculate(double distance)=>distance*20;
}


//luxuary ride calculation
class luxuaryRide extends RideType{
    @override
    double calculate(double distance)=>distance*40;
}

//Encapsulation
class Ride{
  double _distance=0;
  double _fare=0;

  double get distance=>_distance;
  double get fare=>_fare;

  void setDistance(double value){
    if(value<=0){
      print('Distance must be positive');
    }
    _distance=value;
  }

  void calculate(RideType ridetype){
    _fare=ridetype.calculate(_distance);
  }

}

//customer 
class Customer {
  String _name;
  double _wallet;

  Customer(this._name, this._wallet);

  String get name => _name;
  double get wallet => _wallet;
  void bookRide(RideType rideType, double distance) {
    
      Ride ride = Ride();

      ride.setDistance(distance); 
      ride.calculate(rideType);  

      double fare = ride.fare;

      if (_wallet >= fare) {
        _wallet -= fare;
        print("\n Ride booked successfully!");
        print("Fare: $fare");
        print("Remaining Balance: $_wallet");
      } else {
        print("\n Insufficient balance!");
      }
    } 
  }




void main() {

  print("Enter your name:");
  String name = stdin.readLineSync()!;

  print("Enter wallet balance:");
  double balance = double.parse(stdin.readLineSync()!);

  Customer customer = Customer(name, balance);

  print("\nChoose Ride Type:");
  print("1. Bike (10 per km)");
  print("2. Car (20 per km)");
  print("3. Luxury (40 per km)");

  int choice = int.parse(stdin.readLineSync()!);

  print("Enter distance:");
  double distance = double.parse(stdin.readLineSync()!);

  RideType rideType;

  switch (choice) {
    case 1:
      rideType = bikeRide();
      break;
    case 2:
      rideType = carRide();
      break;
    case 3:
      rideType = luxuaryRide();
      break;
    default:
      print("Invalid choice!");
      return;
  }

  customer.bookRide(rideType, distance);
}