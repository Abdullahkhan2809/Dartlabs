class BankAccount {
  double balance;

  // Constructor
  BankAccount(this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Deposited: $amount");
  }

  void withdraw(double amount) {
    balance -= amount;
    print("Withdrawn: $amount");
  }
}

// TODO 1: Make SavingsAccount inherit from BankAccount
class SavingsAccount extends BankAccount {

  // TODO 2: Create constructor and pass balance to parent class
  SavingsAccount(double balance) : super(balance) ;

  // TODO 3: Override withdraw method
  @override
  void withdraw(double amount) {

    // TODO 4: Add condition

    // Withdrawal allowed only if remaining balance >= 500

    if (balance -amount >=500) {
      
      // TODO 5: Call parent withdraw method
        super.withdraw(amount);

    } else {
      print("Minimum balance of 500 required.");
    }
  }
}

void main() {

  // TODO 6: Create SavingsAccount object with initial balance 2000
  SavingsAccount acc =SavingsAccount(5000) ;

  print("Initial Balance: ${acc.balance}");

  // TODO 7: Deposit 500
  acc.deposit(500);

  // TODO 8: Try withdrawing 1700
  acc.withdraw(1700);

  print("Final Balance: ${acc.balance}");
}

