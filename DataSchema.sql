-- Створення таблиці користувачів (перейменовано на AppUser)
CREATE TABLE AppUser (
    user_id INTEGER PRIMARY KEY, 
    username VARCHAR(50) NOT NULL CHECK (username ~ '^[a-zA-Z0-9]{3,50}$'), -- Обмеження на формат і довжину username
    email VARCHAR(100) NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') -- Обмеження на формат email
);

-- Створення таблиці міст
CREATE TABLE City (
    city_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    population INTEGER,
    user_id INTEGER REFERENCES AppUser(user_id) -- Зовнішній ключ на таблицю AppUser
);

-- Створення таблиці сповіщень
CREATE TABLE Notification (
    notification_id INTEGER PRIMARY KEY,
    message TEXT NOT NULL,
    dateSent TIMESTAMP NOT NULL,
    user_id INTEGER REFERENCES AppUser(user_id) -- Зовнішній ключ на таблицю AppUser
);

-- Створення таблиці системи моніторингу якості повітря
CREATE TABLE AirQualityMonitoringSystem (
    system_id INTEGER PRIMARY KEY,
    system_name VARCHAR(100) NOT NULL
);

-- Створення таблиці якості повітря
CREATE TABLE AirQuality (
    airquality_id INTEGER PRIMARY KEY,
    pollutionLevel FLOAT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    city_id INTEGER REFERENCES City(city_id), -- Зовнішній ключ на таблицю City
    system_id INTEGER REFERENCES AirQualityMonitoringSystem(system_id) -- Зовнішній ключ на таблицю AirQualityMonitoringSystem
);

-- Створення таблиці екологічних проблем
CREATE TABLE EnvironmentalIssue (
    environmental_issue_id INTEGER PRIMARY KEY,
    description TEXT NOT NULL,
    severity VARCHAR(50) NOT NULL,
    airquality_id INTEGER REFERENCES AirQuality(airquality_id) -- Зовнішній ключ на таблицю AirQuality
);
