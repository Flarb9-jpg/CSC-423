CREATE TABLE CourseOffering (
	CourseName varchar(255) PRIMARY KEY
);

CREATE TABLE Course (
	CourseName varchar(255), 
	StartMonth varchar(255),
	EndMonth varchar(255),
	WeekDay varchar(255),
	TimeOfDay varchar(255),
    	FOREIGN KEY (CourseName) REFERENCES CourseOffering(CourseName)
);

CREATE TABLE Student (
	StudentName varchar(255) PRIMARY KEY,
	StudentID int UNIQUE,
	Registered int CHECK (Registered = 0 OR Registered = 1),
	FeePaid int CHECK (FeePaid = 0 OR FeePaid = 1)
);

CREATE TABLE Tutor (
	TutorName varchar(255) PRIMARY KEY,
	TutorID int UNIQUE,
	CourseName varchar(255), 
	FOREIGN KEY (CourseName) REFERENCES CourseOffering(CourseName)
);

CREATE TABLE Address (
	StudentName varchar(255),
    	TutorName varchar(255),
	Street varchar(255),
	City varchar(255),
	ZipCode int,
	TelephoneNumber int,
	FOREIGN KEY (StudentName) REFERENCES Student(StudentName),
	FOREIGN KEY (TutorName) REFERENCES Tutor(TutorName)
);

CREATE TABLE TutorAmount (
	TutorID int,
	CourseName varchar(255),
	WeekDay varchar(255),
	TimeOfDay varchar(255),
	ClassSize int,
	FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
	FOREIGN KEY (CourseName) REFERENCES CourseOffering(CourseName)
);

CREATE TABLE Enrolled (
	CourseName varchar(255), 
	StudentName varchar(255),
	TutorName varchar(255),
	FOREIGN KEY (CourseName) REFERENCES CourseOffering(CourseName),
	FOREIGN KEY (StudentName) REFERENCES Student(StudentName),
	FOREIGN KEY (TutorName) REFERENCES Tutor(TutorName)
);

INSERT INTO CourseOffering (CourseName)
VALUES('Spanish Level 1');
INSERT INTO CourseOffering (CourseName)
VALUES('Ancestors 101');
INSERT INTO CourseOffering (CourseName)
VALUES('Biology Level 2');
INSERT INTO CourseOffering (CourseName)
VALUES('Java Programming');
INSERT INTO CourseOffering (CourseName)
VALUES('Finance 127');

INSERT INTO Course (CourseName, StartMonth, EndMonth, WeekDay, TimeOfDay)
VALUES ('Spanish Level 1', 'October', 'March', 'MW', 'Evening');
INSERT INTO Course (CourseName, StartMonth, EndMonth, WeekDay, TimeOfDay)
VALUES ('Ancestors 101', 'October', 'December', 'TW', 'Evening');
INSERT INTO Course (CourseName, StartMonth, EndMonth, WeekDay, TimeOfDay)
VALUES ('Ancestors 101', 'January', 'March', 'TW', 'Evening');
INSERT INTO Course (CourseName, StartMonth, EndMonth, WeekDay, TimeOfDay)
VALUES ('Java Programming', 'January', 'March', 'MWF', 'Morning');
INSERT INTO Course (CourseName, StartMonth, EndMonth, WeekDay, TimeOfDay)
VALUES ('Finance 127', 'August', 'December', 'MTWThF', 'Morning');

INSERT INTO Student (StudentName, StudentID, Registered, FeePaid)
VALUES('Ross Pierson', 123456789, 1, 1);
INSERT INTO Student (StudentName, StudentID, Registered, FeePaid)
VALUES('John Smith', 987654321, 1, 0);
INSERT INTO Student (StudentName, StudentID, Registered, FeePaid)
VALUES('Hanna Miller', 129384756, 1, 1);
INSERT INTO Student (StudentName, StudentID, Registered, FeePaid)
VALUES('Claire Forrest', 564738291, 0, 0);
INSERT INTO Student (StudentName, StudentID, Registered, FeePaid)
VALUES('John Appleseed', 2938561, 1, 1);

INSERT INTO Tutor (TutorName, TutorID, CourseName)
VALUES('Louis Coldwater', 00234, 'Spanish Level 1');
INSERT INTO Tutor (TutorName, TutorID, CourseName)
VALUES('Janice Green', 12334, 'Ancestors 101');
INSERT INTO Tutor (TutorName, TutorID, CourseName)
VALUES('Franklin Kenney', 12234, 'Biology Level 2');
INSERT INTO Tutor (TutorName, TutorID, CourseName)
VALUES('Sarah Strong', 07856, 'Java Programming');
INSERT INTO Tutor (TutorName, TutorID, CourseName)
VALUES('Arthur Johnson', 11032, 'Finance 127');

INSERT INTO TutorAmount (TutorID, CourseName, WeekDay, TimeofDay, ClassSize)
VALUES (00234, 'Spanish Level 1', 'Monday', 'Evening', 20);
INSERT INTO TutorAmount (TutorID, CourseName, WeekDay, TimeofDay, ClassSize)
VALUES(00234, 'Spanish Level 1', 'Wednesday', 'Evening', 25);
INSERT INTO TutorAmount (TutorID, CourseName, WeekDay, TimeofDay, ClassSize)
VALUES(07856, 'Java Programming', 'Friday', 'Morning', 30);
INSERT INTO TutorAmount (TutorID, CourseName, WeekDay, TimeofDay, ClassSize)
VALUES(00234, 'Biology Level 2', 'Thursday', 'Morning', 15);
INSERT INTO TutorAmount (TutorID, CourseName, WeekDay, TimeofDay, ClassSize)
VALUES(11032, 'Finance 127', 'Tuesday', 'Morning', 20);

INSERT INTO Enrolled (CourseName, StudentName, TutorName)
VALUES('Spanish Level 1', 'Ross Pierson', 'Louis Coldwater');
INSERT INTO Enrolled (CourseName, StudentName, TutorName)
VALUES('Spanish Level 1', 'Hanna Miller', 'Louis Coldwater');
INSERT INTO Enrolled (CourseName, StudentName, TutorName)
VALUES('Spanish Level 1', 'John Appleseed', 'Louis Coldwater');
INSERT INTO Enrolled (CourseName, StudentName, TutorName)
VALUES('Java Programming', 'Ross Pierson', 'Sarah Strong');
INSERT INTO Enrolled (CourseName, StudentName, TutorName)
VALUES('Finance 127', 'John Appleseed', 'Arthur Johnson');


INSERT INTO Address (StudentName, Street, City, ZipCode, TelephoneNumber)
VALUES('Ross Pierson', '120 Harvard Drive', 'Daytona Beach', 32176, 5559872345);
INSERT INTO Address (StudentName, Street, City, ZipCode, TelephoneNumber)
VALUES('John Smith', '111 Kent Lane', 'Springfield', 12345, 5552349087);
INSERT INTO Address (StudentName, Street, City, ZipCode, TelephoneNumber)
VALUES('Hanna Miller', '41 Charcoal Road', 'Westport', 11245, 5552147204);
INSERT INTO Address (TutorName, Street, City, ZipCode, TelephoneNumber)
VALUES('Louis Coldwater', '321 Sunny Blvd', 'Miami', 65321, 5551092837);
INSERT INTO Address (TutorName, Street, City, ZipCode, TelephoneNumber)
VALUES('Sarah Strong', '5 College Street', 'Kansas City', 54321, 5558675309);
