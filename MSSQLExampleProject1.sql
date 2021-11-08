Use MSSQLExampleProject;

GO

CREATE TABLE ProjectStatus(
	ProjectStatusID INT PRIMARY KEY IDENTITY(1,1),
	ProjectStatusName VARCHAR(50) UNIQUE NOT NULL);
GO

CREATE TABLE Positions(
	PositionID INT PRIMARY KEY IDENTITY(1,1),
	PositionName VARCHAR(30) NOT NULL);
GO

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FullName VARCHAR(50) NOT NULL,
	FKPositionID INT NOT NULL,
	FOREIGN KEY (FKPositionID) REFERENCES Positions(PositionID));
GO

CREATE TABLE TaskStatus(
	TaskStatusID INT PRIMARY KEY IDENTITY(1,1),
	TaskStatusName VARCHAR(30) NOT NULL);
GO

CREATE TABLE Projects(
	ProjectID INT PRIMARY KEY IDENTITY(1,1), 
	ProjectName VARCHAR(50) UNIQUE NOT NULL,
	DateOfCreation DATETIME NOT NULL,
	DateOfClosing DATETIME,
	FKProjectStatusID INT NOT NULL,
	FOREIGN KEY (FKProjectStatusID) REFERENCES ProjectStatus(ProjectStatusID));
GO

CREATE TABLE Tasks(
	TaskID INT PRIMARY KEY IDENTITY(1,1),
	TaskName VARCHAR(50) UNIQUE NOT NULL,
	DateOfChange DATETIME,
	Deadline DATETIME NOT NULL,
	FKTaskStatusID INT NOT NULL,
	FKEmployeeID INT NOT NULL,
	FKProjectID INT NOT NULL,
	FOREIGN KEY (FKProjectID) REFERENCES Projects(ProjectID),
	FOREIGN KEY (FKEmployeeID) REFERENCES Employees(EmployeeID),
 	FOREIGN KEY (FKTaskStatusID) REFERENCES TaskStatus(TaskStatusID));
GO

CREATE TABLE EmployeesProjects(
	EmployeeID INT,
	ProjectID INT,
	PRIMARY KEY(EmployeeID, ProjectID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID));
