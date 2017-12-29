CREATE TABLE [dbo].[Product]
(
	[ID] INT NOT NULL PRIMARY KEY,
	[ProductName] NVARCHAR(255) NOT NULL,
	[Location] NVARCHAR(255),
	[Hardware] TEXT,
	[Software] TEXT,
	[PurchaseDate] DATE,
	[RenewalDate] DATE,
	[ActiveStatus] TEXT,
	[ATCStaff] NVARCHAR(50),
	[ISContactID] INT
)
