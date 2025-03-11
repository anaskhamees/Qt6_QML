# Modern Cpp Project
### **Project Folder Structure**

```c++
ATM_Project/
│── src/
│   ├── main.cpp
│   ├── ATM.cpp
│   ├── Account.cpp
│   ├── Transaction.cpp
│── include/
│   ├── ATM.h
│   ├── Account.h
│   ├── Transaction.h
│── build/
│── CMakeLists.txt
│── README.md
```

------

### **📌 Explanation of Each File**

📂 **`ATM_Project/`**

- **`src/`** → Contains all C++ **source files** (`.cpp`).
- **`include/`** → Contains all **header files** (`.h`) for class declarations.
- **`build/`** → Stores compiled binary files (created when you compile the project).
- **`CMakeLists.txt`** → Build system file (for CMake users).
- **`README.md`** → Project documentation.

## **Static Design (Class Diagram)**

The system consists of the following classes:

### **1️⃣ `Transaction` Class**

- Represents a deposit or withdrawal transaction.
- Stores the **transaction type**, **amount**, and **timestamp**.

### **2️⃣ `Account` Class**

- Represents a bank account with authentication, deposit, withdrawal, and transaction history.
- Stores **account number**, **PIN**, **balance**, and a **vector of transactions**.
- Uses **`emplace_back`** for efficient transaction insertion.

### **3️⃣ `ATM` Class**

- Manages multiple **`Account`** instances using `std::shared_ptr`.
- Handles **authentication** and **account lookup**.

------

### **📌 Class Relationships**

1️⃣ **ATM → Account** → (`1 → Many`)

- **The ATM manages multiple accounts using a vector of shared pointers.**

2️⃣ **Account → Transaction** → (`1 → Many`)

- **Each account has multiple transactions stored in a vector.**



| **Classes**               | **Relationship Type** | **Explanation**                                              |
| ------------------------- | --------------------- | ------------------------------------------------------------ |
| `Account` ↔ `Transaction` | **Composition**       | `Account` owns `Transaction`, and transactions cannot exist without an account. |
| `ATM` ↔ `Account`         | **Aggregation**       | `ATM` manages accounts but does not own them. Accounts can exist independently. |
| `ATM` ↔ `User` (Implicit) | **Association**       | The user interacts with `ATM` but is not owned or stored by it. |

------

### **📝 Class Diagram (Text Representation)**

```c++
+-----------------+
|     ATM         |
+-----------------+
| - accounts: vector<shared_ptr<Account>> |
|-----------------|
| + addAccount()  |
| + authenticate()|
+-----------------+
        |
        | (1 → Many)
        v
+-----------------+
|    Account     |
+-----------------+
| - accNumber: string |
| - pin: int |
| - balance: double |
| - transactions: vector<Transaction> |
|-----------------|
| + authenticate() |
| + deposit() |
| + withdraw() |
| + showTransactionHistory() |
| + sortTransactionsByAmount() |
+-----------------+
        |
        | (1 → Many)
        v
+-----------------+
|   Transaction  |
+-----------------+
| - type: string |
| - amount: double |
| - timestamp: string |
|-----------------|
| + Constructor() |
+-----------------+
```

------

------

## **📌 Dynamic Design (Sequence Diagram)**

The **sequence diagram** represents the flow of interactions between objects during authentication, deposit, and withdrawal.

### **📝 Sequence Diagram (Text Representation)**

```
User                ATM               Account              				 Transaction
 |                   |                    |                  					 |
 |---- enter PIN --->|                    |                  					 |
 |                   |---- authenticate -->|                  					 |
 |                   |  PIN correct? (✔️)  |                  					  |
 |                   |<---- return account-|              					     |
 |                   |                    |              					     |
 |---- deposit(500) ->|                    |            				         |
 |                   |---- deposit(500) -->|            				         |
 |                   |                    |---- create Transaction ("Deposit", 500) --->|
 |                   |                    |<---- store Transaction in vector ----|
 |                   |                    |                  					 |
 |                   |<--- balance updated ($1500) ----|
 |                   |                    |                  					 |
 |---- withdraw(200)->|                    |                 				     |
 |                   |---- withdraw(200) -->|                				     |
 |                   |                    |-- create Transaction ("Withdrawal", 200)--->|
 |                   |                    |<---- store Transaction in vector ----|
 |                   |                    |                   |
 |                   |<--- balance updated ($1300) ----|
```

------

## **📌 Summary of the Design**

✅ **Static Design (Class Diagram):**

- `ATM` class manages multiple `Account` instances.
- `Account` class maintains a transaction history.
- `Transaction` class records individual transactions.

✅ **Dynamic Design (Sequence Diagram):**

- **Authentication flow** (User → ATM → Account).
- **Deposit flow** (User → ATM → Account → Transaction).
- **Withdrawal flow** (User → ATM → Account → Transaction).



-------------

`std::ostringstream` is a **string-based output stream** in C++ that is part of the `<sstream>` library. It allows us to **format and store** data in a string **like an output stream (`std::cout`) but in memory instead of printing it**.

```c++
#include <iostream>
#include <sstream>  // Required for ostringstream

int main() {
    std::ostringstream oss;  // Create an output string stream
    int age = 25;
    std::string name = "Anas";

    oss << "Name: " << name << ", Age: " << age; // Similar to std::cout

    std::string result = oss.str(); // Convert stream to string
    std::cout << result << std::endl; // Output: Name: Anas, Age: 25

    return 0;
}

```

**Why Use `std::ostringstream` Instead of `std::string`?**

| Feature                                  | `std::ostringstream`         | `std::string`                      |
| ---------------------------------------- | ---------------------------- | ---------------------------------- |
| ✅ **Stream-like Formatting**             | Yes (`oss << value`)         | No                                 |
| ✅ **Handles Multiple Data Types Easily** | Yes                          | No                                 |
| ✅ **Works like `std::cout`**             | Yes                          | No                                 |
| ✅ **Faster than Concatenation (`+`)**    | Yes (for multiple additions) | No (each `+` creates a new string) |



### Project

------

```c++
#include <iostream>     // For input/output operations
#include <vector>       // For storing transactions and accounts
#include <memory>       // For smart pointers (std::shared_ptr)
#include <algorithm>    // For sorting transactions
#include <string>       // For std::string
#include <string_view>  // For lightweight string handling
#include <ctime>        // For getting current time
#include <sstream>      // For string stream (std::ostringstream)
#include <iomanip>      // For formatting time (std::put_time)

// ✅ Utility function to get the current timestamp
std::string getCurrentTime() {
    std::ostringstream oss;  // String stream to format the output
    std::time_t now = std::time(nullptr);  // Get current system time
    oss << std::put_time(std::localtime(&now), "%Y-%m-%d %H:%M:%S");  // Format time as YYYY-MM-DD HH:MM:SS
    return oss.str();
}

// ✅ Transaction class to store details of each transaction
class Transaction {
public:
    std::string type;  // Type of transaction ("Deposit" or "Withdrawal")
    double amount;     // Amount involved in the transaction
    std::string timestamp;  // Time when the transaction occurred

    // Constructor initializes the transaction with type, amount, and current time
    Transaction(std::string_view type, double amount)
        : type(type), amount(amount), timestamp(getCurrentTime()) {}
};

// ✅ Account class representing a bank account
class Account {
private:
    std::string accNumber;         // Account number
    int pin;                       // PIN for authentication
    double balance;                // Account balance
    std::vector<Transaction> transactions; // Transaction history

public:
    // Constructor to initialize account with number, PIN, and balance
    Account(std::string_view accNumber, int pin, double initialBalance)
        : accNumber(accNumber), pin(pin), balance(initialBalance) {}

    // ✅ Authenticate account using PIN
    bool authenticate(int enteredPin) const {
        return pin == enteredPin;
    }

    // ✅ Deposit function
    void deposit(double amount) {
        balance += amount; // Increase balance
        transactions.emplace_back("Deposit", amount); // Record transaction
        std::cout << "Deposit Successful! New Balance: $" << balance << "\n";
    }

    // ✅ Withdrawal function
    bool withdraw(double amount) {
        if (amount > balance) {
            std::cout << "Insufficient balance!\n";
            return false;
        }
        balance -= amount; // Deduct balance
        transactions.emplace_back("Withdrawal", amount); // Record transaction
        std::cout << "Withdrawal Successful! New Balance: $" << balance << "\n";
        return true;
    }

    // ✅ Display transaction history
    void showTransactionHistory() const {
        std::cout << "Transaction History for Account " << accNumber << ":\n";
        for (const auto& tx : transactions) {
            std::cout << tx.type << " of $" << tx.amount << " on " << tx.timestamp << "\n";
        }

        // ✅ Lambda function to filter withdrawals
        auto isWithdrawal = [](const Transaction& tx) {
            return tx.type == "Withdrawal";
        };

        // ✅ Display only withdrawal transactions
        std::cout << "\nFiltered Withdrawals:\n";
        for (const auto& tx : transactions) {
            if (isWithdrawal(tx)) {
                std::cout << tx.type << " of $" << tx.amount << " on " << tx.timestamp << "\n";
            }
        }
    }

    // ✅ Sort transactions by amount
    void sortTransactionsByAmount() {
        std::sort(transactions.begin(), transactions.end(), [](const Transaction& a, const Transaction& b) {
            return a.amount < b.amount; // Sort ascending
        });
        std::cout << "Transactions sorted by amount!\n";
    }

    // ✅ Display account balance
    void displayBalance() const {
        std::cout << "Current Balance: $" << balance << "\n";
    }
};

// ✅ ATM class (Manages multiple accounts)
class ATM {
private:
    std::vector<std::shared_ptr<Account>> accounts; // Stores accounts

public:
    // ✅ Add a new account to the ATM
    void addAccount(std::string_view accNumber, int pin, double initialBalance) {
        accounts.emplace_back(std::make_shared<Account>(accNumber, pin, initialBalance));
    }

    // ✅ Authenticate and return an account
    std::shared_ptr<Account> authenticate(std::string_view accNumber, int enteredPin) {
        for (const auto& acc : accounts) {
            if (acc->authenticate(enteredPin)) {
                std::cout << "Authentication successful!\n";
                return acc;
            }
        }
        std::cout << "Authentication failed!\n";
        return nullptr;
    }
};

// ✅ Main function
int main() {
    ATM atm;
    atm.addAccount("12345", 1234, 1000.0); // Create an account

    std::string accNumber;
    int pin;

    // User login
    std::cout << "Enter Account Number: ";
    std::cin >> accNumber;
    std::cout << "Enter PIN: ";
    std::cin >> pin;

    // Authenticate user
    auto account = atm.authenticate(accNumber, pin);
    if (!account) return 0;

    // ✅ Lambda function for handling transactions
    auto performAction = [&](std::string_view action, double amount = 0) {
        if (action == "deposit") {
            account->deposit(amount);
        } else if (action == "withdraw") {
            account->withdraw(amount);
        } else if (action == "balance") {
            account->displayBalance();
        } else if (action == "history") {
            account->showTransactionHistory();
        } else if (action == "sort") {
            account->sortTransactionsByAmount();
        } else {
            std::cout << "Invalid action!\n";
        }
    };

    // ✅ Simulated transactions
    std::cout << "--------------- Scenario 1---------------\n";
    performAction("deposit", 500);
    performAction("withdraw", 200);
    performAction("balance");
    performAction("history");
    performAction("sort");
    performAction("history");
    std::cout << "---------------------------------------\n";

    std::cout << "--------------- Scenario 2---------------\n";
    performAction("deposit", 1000);
    performAction("deposit", 300);
    performAction("balance");
    performAction("history");
    performAction("sort");
    performAction("history");
    std::cout << "---------------------------------------\n";

    std::cout << "--------------- Scenario 3---------------\n";
    performAction("withdraw", 5000); // Attempt to withdraw more than balance
    performAction("balance");
    std::cout << "---------------------------------------\n";
    
    return 0;
}

```

**User Authentication** with PIN verification.
 ✅ **List Initialization** for objects (`Transaction`, `Account`).
 ✅ **`std::vector`** for managing transactions & accounts.
 ✅ **Smart Pointers (`std::shared_ptr`)** for automatic memory management.
 ✅ **String View (`std::string_view`)** for efficient string handling.
 ✅ **Lambda Expressions** for:

- **Filtering transactions** (e.g., finding withdrawals).
- **Sorting transactions** by amount.
- **Handling user actions dynamically.**

----------------

#### To Do :

- **Central Bank** 
- **File-based storage (Saving transactions to a file)**
- **More security features (e.g., limited attempts before lockout)**
- **Hash the PIN instead of storing it in plain text**.
- **Expand the ATM system with an Admin Panel**

- **UML Design of the Project**
