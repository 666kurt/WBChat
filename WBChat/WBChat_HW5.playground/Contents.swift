import Foundation

// MARK: - Протоколы

// Протокол для идентифицируемого объекта
protocol Identifiable {
    var id: String { get }
}

// Протокол для паспорта
protocol PassportProtocol: Identifiable {
    var series: String { get }
    var number: Int { get }
    var issueDate: Date { get }
}

// Протокол для человека
protocol PersonProtocol {
    var fullName: String { get }
    var age: Int { get }
    var passport: PassportProtocol? { get set }
}

// MARK: - Классы

// Класс, описывающий паспорт
final class Passport: PassportProtocol {
    let series: String
    let number: Int
    let issueDate: Date
    weak var person: Person? // weak для избежания сильного цикла ссылок
    var id: String {
        return "\(series) \(number)"
    }
    
    init(series: String, number: Int, issueDate: Date, person: Person? = nil) {
        // Проверка корректности серии и номера
        guard series.count == 2, number > 0 else {
            fatalError("Некорректные серия или номер паспорта")
        }
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.person = person
        print("Инициализация паспорта \(id)")
    }
    
    deinit {
        print("Деинициализация паспорта \(id)")
    }
}

// Класс, описывающий человека
final class Person: PersonProtocol {
    var fullName: String
    let age: Int
    private(set) var passportNumber: Int
    var passport: PassportProtocol?
    
    init(fullName: String, age: Int, passportNumber: Int, passport: Passport? = nil) {
        self.fullName = fullName
        self.age = age
        self.passportNumber = passportNumber
        self.passport = passport
        print("Инициализация человека \(fullName)")
    }
    
    deinit {
        print("Деинициализация человека \(fullName)")
    }
}

// MARK: - Тестирование

func testMemoryManagement() {
    // Замыкание чтобы объекты деинициализировались по завершении функции
    do {
        // Создание объекта человека
        var person1: Person? = Person(fullName: "Иван Иванов", age: 30, passportNumber: 123456)
        
        // Создание объекта паспорта
        var passport1: Passport? = Passport(series: "AB", number: 123456, issueDate: Date(), person: person1)
        
        // Устанавливаем ссылку на паспорт в объекте Person
        person1?.passport = passport1
        
        // Устанавливаем слабую ссылку на человека в объекте Passport
        passport1?.person = person1
        
        // Проверка инициализации объектов
        print("Паспорт ID: \(passport1?.id ?? "Нет данных")")
        print("Владелец паспорта: \(passport1?.person?.fullName ?? "Нет данных")")
        
        // Деинициализируем объекты
        person1 = nil
        passport1 = nil
    }
    // Деинициализация оставшихся объектов после выхода из замыкания
}

// Запуск тестирования
testMemoryManagement()

