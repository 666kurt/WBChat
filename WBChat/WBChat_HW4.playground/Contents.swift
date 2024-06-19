import UIKit

// MARK: Класс Account и протоколы

// Протоколы для депозита и снятия (пытаемся соотвествовать принципу ISP)
protocol Depositable {
    func deposit(amount: Double)
}

protocol Withdrawable {
    func withdraw(amount: Double) -> Bool
}

// Реализация класса аккаунт через протоколы
final class Account: Depositable, Withdrawable {
    
    var id: String
    var balance: Double
    
    init(id: String, balance: Double) {
        self.id = id
        self.balance = balance
    }
    
    // Метод депозита
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Сумма должна быть положительна!")
            return
        }
        balance += amount
    }
    
    // Метод снятия
    func withdraw(amount: Double) -> Bool {
        guard amount > 0 else {
            print("Сумма должна быть положительна!")
            return false
        }
        if amount > balance {
            print("Недостаточно средств на счете \(id)")
            return false
        }
        balance -= amount
        return true
    }
}

// MARK: Класс Bank, протоколы и менеджеры

// Протокол для управления счетами
protocol AccountManager {
    func addAccount(id: String, initialBalance: Double)
    func getAccount(byId id: String) -> Account?
    
    var allAccount: [Account] { get }
}

// Протокол для управления транзакциями
protocol TransactionManager {
    func deposit(toAccountId accountId: String, amount: Double)
    func transfer(fromAccountId: String, toAccountId: String, amount: Double)
}

// Класс для управления счетами
class MyAccountManager: AccountManager {
    
    // Инициализация словаря для хранения аккаунтов
    private var accounts: [String: Account] = [:]
    
    // Метод добавления аккаунта
    func addAccount(id: String, initialBalance: Double) {
        let newAccount = Account(id: id, balance: initialBalance)
        accounts[id] = newAccount
    }
    
    // Метод получения аккаунта по id из словаря
    func getAccount(byId id: String) -> Account? {
        return accounts[id]
    }
    
    // Метод обновления аккаунта
    func updateAccount(_ account: Account) {
        accounts[account.id] = account
    }
    
    // Вычисляемое свойство для получения всех аккаунтов из словаря
    var allAccount: [Account] {
        return Array(accounts.values)
    }
    
}

// Класс для управления транзакциями
class MyTransactionManager: TransactionManager {
    
    private let accountManager: AccountManager
    
    init(accountManager: AccountManager) {
        self.accountManager = accountManager
    }
    
    // Реализация метода для пополнения счета и его обновления
    func deposit(toAccountId accountId: String, amount: Double) {
        guard let account = accountManager.getAccount(byId: accountId) else {
            print("Счет \(accountId) не найден")
            return
        }
        account.deposit(amount: amount)
        (accountManager as? MyAccountManager)?.updateAccount(account)
    }
    
    // Реализация метода перевода со счета на счет и их обновление
    func transfer(fromAccountId: String, toAccountId: String, amount: Double) {
        
        guard let fromAccount = accountManager.getAccount(byId: fromAccountId) else {
            print("Счет \(fromAccountId) не найден")
            return
        }
        
        guard let toAccount = accountManager.getAccount(byId: toAccountId) else {
            print("Счет \(toAccountId) не найден")
            return
        }
        
        if fromAccount.withdraw(amount: amount) {
            toAccount.deposit(amount: amount)
            (accountManager as? MyAccountManager)?.updateAccount(fromAccount)
            (accountManager as? MyAccountManager)?.updateAccount(toAccount)
        }
    }
    
}

// Реализация основого класса Bank
class Bank {
    private let accountManager: AccountManager
    private let transactionManager: TransactionManager
    
    init(accountManager: AccountManager, transactionManager: TransactionManager) {
        self.accountManager = accountManager
        self.transactionManager = transactionManager
    }
    
    func addAccount(id: String, initialBalance: Double) {
        accountManager.addAccount(id: id, initialBalance: initialBalance)
    }
    
    func deposit(toAccountId: String, amount: Double) {
        transactionManager.deposit(toAccountId: toAccountId, amount: amount)
    }
    
    func transfer(fromAccountId: String, toAccountId: String, amount: Double) {
        transactionManager.transfer(fromAccountId: fromAccountId, toAccountId: toAccountId, amount: amount)
    }
    
    func displayAccount() {
        accountManager.allAccount.forEach { account in
            print("Счет: \(account.id), баланс: \(account.balance)")
        }
    }
}

// MARK: Тестирование программы

let accountManager = MyAccountManager()
let transactionManager = MyTransactionManager(accountManager: accountManager)

let bank = Bank(accountManager: accountManager, transactionManager: transactionManager)

bank.addAccount(id: "WB1", initialBalance: 2000)
bank.addAccount(id: "WB2", initialBalance: 4000)
bank.addAccount(id: "WB3", initialBalance: 500)

print("Состояние всех счетов:")
bank.displayAccount()

print("Депозит:")
bank.deposit(toAccountId: "WB2", amount: 1900)
bank.displayAccount()

print("Транзакция:")
bank.transfer(fromAccountId: "WB1", toAccountId: "WB3", amount: 2000)
bank.displayAccount()
