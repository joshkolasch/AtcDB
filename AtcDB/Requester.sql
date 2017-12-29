CREATE TABLE [dbo].[Requester]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL,
	[DepartmentID] INT,
	[PhoneNumber] NVARCHAR(20),
	[Email] NVARCHAR(100)
)
