CREATE TABLE APPUSER (
    USER_ID INTEGER PRIMARY KEY,
    USERNAME VARCHAR(50) NOT NULL
    CHECK (USERNAME ~ '^[a-zA-Z0-9]{3,50}$'),
    EMAIL VARCHAR(100) NOT NULL
    CHECK (EMAIL ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')
);

CREATE TABLE CITY (
    CITY_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    POPULATION INTEGER,
    USER_ID INTEGER REFERENCES APPUSER (USER_ID)
);

CREATE TABLE NOTIFICATION (
    NOTIFICATION_ID INTEGER PRIMARY KEY,
    MESSAGE TEXT NOT NULL,
    DATESENT TIMESTAMP NOT NULL,
    USER_ID INTEGER REFERENCES APPUSER (USER_ID)
);

CREATE TABLE AIRQUALITYMONITORINGSYSTEM (
    SYSTEM_ID INTEGER PRIMARY KEY,
    SYSTEM_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE AIRQUALITY (
    AIRQUALITY_ID INTEGER PRIMARY KEY,
    POLLUTIONLEVEL FLOAT NOT NULL,
    TIMESTAMP TIMESTAMP NOT NULL,
    CITY_ID INTEGER REFERENCES CITY (CITY_ID),
    SYSTEM_ID INTEGER REFERENCES AIRQUALITYMONITORINGSYSTEM (SYSTEM_ID)
);

CREATE TABLE ENVIRONMENTALISSUE (
    ENVIRONMENTAL_ISSUE_ID INTEGER PRIMARY KEY,
    DESCRIPTION TEXT NOT NULL,
    SEVERITY VARCHAR(50) NOT NULL,
    AIRQUALITY_ID INTEGER REFERENCES AIRQUALITY (AIRQUALITY_ID)
);
