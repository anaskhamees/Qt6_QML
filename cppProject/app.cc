#include <iostream>
#include <vector>
#include <memory>
#include <algorithm>
#include <string>
#include <string_view>
#include <ctime>
#include <sstream>  // Required for std::ostringstream
#include <iomanip>  // Required for std::put_time

// ✅ Utility function to get the current timestamp
std::string getCurrentTime() {
    std::ostringstream oss;
    std::time_t now = std::time(nullptr);
    oss << std::put_time(std::localtime(&now), "%Y-%m-%d %H:%M:%S");
    return oss.str();
}

// ✅ Transaction class to store details of each transaction
class Transaction {
public:
    std::string type;      // Type of transaction (Deposit/Withdrawal)
    double amount;         // Amount involved
    std::string timestamp; // Timestamp of transaction

    // Constructor initializes transaction details
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

