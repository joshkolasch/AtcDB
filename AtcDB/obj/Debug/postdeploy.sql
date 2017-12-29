/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
INSERT INTO Department (ID, Name)
VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'Art'),
(4, 'English');
*/

MERGE INTO Department AS Target
USING(VALUES
		(1, 'Math'),
		(2, 'Science'),
		(3, 'Art'),
		(4, 'English')
)
AS Source(ID, Name)
ON Target.ID = Source.ID
WHEN NOT MATCHED BY Target THEN
INSERT(Name)
VALUES(Name);

MERGE INTO Product AS Target
USING (VALUES
		(1, 'CBC Email', 'www.cbcemail.com', 'No', 'Yes', '2012-12-12', '2013-12-12', 'Active', 'Joe Azir', 1),
		(2, 'CBC Games', 'www.cbcgames.com', 'No', 'Yes', '2012-12-12', '2014-12-12', 'Active', 'Joe Azir', 2),
		(3, 'CBC Kiosk', 'www.cbckiosk.com', 'Yes', 'Yes', '2012-12-12', '2013-12-12', 'Active', 'Brent Trenton', 3)
)
AS Source (ID, ProductName, Location, Hardware, Software, PurchaseDate, RenewalDate, ActiveStatus, ATCStaff, ISContactID)
ON Target.ID = Source.ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ProductName, Location, Hardware, Software, PurchaseDate, RenewalDate, ActiveStatus, ATCStaff, ISContactID)
VALUES (ProductName, Location, Hardware, Software, PurchaseDate, RenewalDate, ActiveStatus, ATCStaff, ISContactID);


MERGE INTO Accessibility AS Target
USING (VALUES
		(1, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes'),
		(2, 'Yes', 'No', 'Yes', 'No', 'Yes'),
		(3, 'No', 'Yes', 'Yes', 'No', 'No')
)
AS Source (ProductID, Jaws, NVDA, Dragon, Zoomtext, Kurdwell)
ON Target.ProductID = Source.ProductID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProductID, Jaws, NVDA, Dragon, Zoomtext, Kurdwell)
VALUES (ProductID, Jaws, NVDA, Dragon, Zoomtext, Kurdwell);


MERGE INTO Attachment AS Target
USING (VALUES
		(1, 1, 'CBCEmail.docx', 'C:/User/Sam/Document'),
		(2, 2, 'games.pdf', 'M:/User/Greg/Documents/Products/CBCgames'),
		(3, 2, 'CBCEmail.docx', 'M:/User/Greg/Documents/Product List')
)
AS Source (ID, ProductID, FileName, FilePath)
ON Target.ID = Source.ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ID, ProductID, FileName, FilePath)
VALUES (ID, ProductID, FileName, FilePath);

MERGE INTO ProductRequest AS Target
USING (VALUES
		(1,1),
		(2,3),
		(1,2),
		(3,1)
)
AS Source (ProductID, RequesterID)
ON Target.ProductID = Source.ProductID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ProductID, RequesterID)
VALUES (ProductID, RequesterID);

MERGE INTO Requester AS Target
USING (VALUES
		(1, 'Brett Samson', 1, '555-2222', 'bsamson@cbc.com'),
		(2, 'Jamie Ortiz', 1, '555-2223', 'jortiz@cbc.com'),
		(3, 'Sarah Caster', 3, '555-2224', 'scaster@cbc.com')
)
AS Source (ID, Name, DepartmentID, PhoneNumber, Email)
ON Target.ID = Source.ID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (ID, Name, DepartmentID, PhoneNumber, Email)
VALUES (ID, Name, DepartmentID, PhoneNumber, Email);

MERGE INTO ISContact AS Target
USING (VALUES
		(1, 'Joe Smith', '555-1111', 'jsmith@cbc.com'),
		(2, 'Amber Betz', '555-1112', 'abetz@cbc.com'),
		(3, 'Sam Jones', '555-1113', 'sjones@cbc.com')
)
AS Source (ID, Name, PhoneNumber, Email)
ON Target.ID = Source.ID
WHEN NOT MATCHED BY TARGET THEN
INSERT (ID, Name, PhoneNumber, Email)
VALUES (ID, Name, PhoneNumber, Email);
GO
