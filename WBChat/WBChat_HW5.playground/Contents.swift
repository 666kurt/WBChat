import Foundation

// MARK: Паспорт

// Протокол для идентифицируемого объекта
protocol Identifiable {
    var id: String { get }
}

// Класс, описывающий паспорт
final class Passport: Identifiable {
    let series: String
    let number: Int
    let date: Date
    weak var person: Person? // weak для избежания сильного цикла ссылок
    var id: String {
        return "\(series) \(number)"
    }
    
    init(series: String, number: Int, date: Date, person: Person? = nil) {
        self.series = series
        self.number = number
        self.date = date
        self.person = person
        print("Инициализация паспорта \(id)")
    }
    
    deinit {
        print("Деинициализация паспорта \(id)")
    }
}

// MARK: Человек

// Протокол для определения класса Person
protocol PersonProtocol {
    var fullName: String { get }
    var age: Int { get }
    var passport: Identifiable? { get set }
}

// Класс, описывающий человека
final class Person: PersonProtocol {
    var fullName: String
    let age: Int
    private(set) var passwordNumber: Int
    var passport: Identifiable?
    
    init(fullName: String, age: Int, passwordNumber: Int, passport: Passport? = nil) {
        self.fullName = fullName
        self.age = age
        self.passwordNumber = passwordNumber
        self.passport = passport
        print("Инициализация человека \(fullName)")
    }
    
    deinit {
        print("Деинициализация паспорта \(fullName)")
    }
}


// MARK: Тестирование

func testMemoryManagement() {
    // Замыкание чтобы объекты деинициализировались по завершении функции
    do {
        // Создание объекта человека
        var person1: Person? = Person(fullName: "Иван Иванов", age: 30, passwordNumber: 123456)
        
        // Создание объекта паспорта
        var passport1: Passport? = Passport(series: "AB", number: 123456, date: Date(), person: person1)
        
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


testMemoryManagement()
