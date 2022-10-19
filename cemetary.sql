-- cemetary 
-- waterloofairview

-- spencer@raspberrypi:~ $ sudo mysql -u root
CREATE DATABASE cardcatolog;
USE cardcatolog;

CREATE TABLE locations( locationID INT UNSIGNED AUTO_INCREMENT,
    sectionID VARCHAR(2),
    plotNum TINYINT(3) UNSIGNED,
    rowID VARCHAR(2),
    columnNum TINYINT(4) UNSIGNED,
    graveNumber TINYINT(4) UNSIGNED,
    latitude DECIMAL(8,6) NOT NULL DEFAULT "42.511270",
    longitude DECIMAL(8,6) NOT NULL DEFAULT "-90.347831",
    svgID VARCHAR(10),
    notes TEXT,
    PRIMARY KEY(locationID)
)Engine=innodb;


CREATE TABLE persons( personID INT UNSIGNED AUTO_INCREMENT,
    firstName VARCHAR(50), 
    lastName VARCHAR(50), 
    birthYear SMALLINT UNSIGNED, 
    deathYear SMALLINT UNSIGNED, 
    dob DATE,
    dod DATE,
    webAddress TEXT,
    locationId INT UNSIGNED,
    PRIMARY KEY(personID), 
    CONSTRAINT fk_de_type 
    FOREIGN KEY(locationId) 
    REFERENCES locations(locationID)
)Engine=innodb;


INSERT INTO locations(sectionID,plotNum,gravenumber,svgID) values (16,183,1,'path12969'),
    (16,183,2,'path12969'),
    (16,183,3,'path12969'),
    (16,183,4,'path12969'),
    (16,183,5,'path12969'),
    (16,183,6,'path12969'),
    (16, 52,1,'path13067'),
    (16,181,1,'path12973'),
    (16,125,1,'path13085'),
    (16,200,1,'path12947'),
    (16, 95,1,'path13033'),
    (16,151,1,'path12937');


INSERT INTO persons(firstName,lastName,birthYear,deathYear,locationID) values 
    ('Abby','Patterson','1834','1902',1),
    ('George','Adams','1878','1898',2),
    ('Oliver','Addams','1807','1897',3),
    ('John','Ackerman',1865,1898,7),
    ('Joe','Ackerman',1871,1901,8),
    ('Charles','Clifton',NULL,1908,9),
    ('Drayten','Cluller',1845,1908,10),
    ('George','Eddie',NULL,1909,11),
    ('Lionel','Harvey',1890,1922,12);
INSERT INTO persons(firstName,lastName,dob,dod, locationID) values 
    ('Mary','Farrell grow','1869*8*5','1949*6*15',4),
    ('Edward','Farrell','1865*5*25','1918*8*7',5),
    ('Austin P.','Hemminger','1859*9*21','1897*9*17',6);

CREATE USER 'cemetary'@localhost identified by 'waterloofairview';
grant select on cardcatolog.persons, cardCatolog.locations to cemetary@localhost;

-- spencer@raspberrypi:~ $ sudo mysql -u  cemetary -p