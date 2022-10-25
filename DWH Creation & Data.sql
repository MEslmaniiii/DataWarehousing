CREATE TABLE FactCRM(
CRMID  INT IDENTITY  NOT NULL,
issue  VARCHAR(100),
Product VARCHAR(50),
Sub_Product VARCHAR(50),
SubmittedVia VARCHAR(20),
TimelyResponse VARCHAR(10),
EventId INT,
ReviewId INT,
CallID INT,
CustomerId INT)
------------
CREATE TABLE DimCRM_Reveiw(
ReviewID INT IDENTITY,
Stars INT,
Review NVARCHAR(MAX),
Review_DatE DATE)
-------------
CREATE TABLE Dim_CRM_Events(
EVENTID INT IDENTITY,
CompanyResponse NVARCHAR(500),
Consumer_Complaint NVARCHAR(600),
DateRecieved DATE ,
DateSent DATE)
------------------------
CREATE TABLE Dim_CRM_CallCenter (
CallID INT IDENTITY ,
DateRecieved DATE,
PhoneFinal NVARCHAR(15),
OutCome VARCHAR (20),
ServeeR VARCHAR (20))



