USE ismgroup14;

CREATE TABLE Users (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    account_password VARCHAR(80) NOT NULL
);


CREATE TABLE Cars (
    carID INT AUTO_INCREMENT PRIMARY KEY,
    carType VARCHAR(50),
    model VARCHAR(50),
    fuel VARCHAR(50),
    hybrid BOOLEAN,
    transmission BOOLEAN,
    year_car YEAR,
    price DECIMAL(10, 2),
    ownerID INT,
    car_image BLOB,
    FOREIGN KEY (ownerID) REFERENCES Users(userID)
);

CREATE TABLE Rental (
    rentalID INT AUTO_INCREMENT PRIMARY KEY,
    renterID INT,
    carID INT,
    start_datetime DATETIME,
    end_datetime DATETIME,
    place VARCHAR(80) NOT NULL,
    FOREIGN KEY (renterID) REFERENCES Users(userID),
    FOREIGN KEY (carID) REFERENCES Cars(carID)
);
CREATE TABLE UserInfo (
    userInfoID INT AUTO_INCREMENT PRIMARY KEY,
    rentalID INT ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    phone VARCHAR(20),
    FOREIGN KEY (rentalID) REFERENCES Rental(rentalID)
);