CREATE TABLE UserType
(
	Id smallint identity(1,1) NOT NULL CONSTRAINT PK_UserTypeId PRIMARY KEY,
	Type VARCHAR(50) NOT NULL,
	Description VARCHAR(200) NULL
)

CREATE TABLE Users
(
	Id bigint identity(1,1) NOT NULL CONSTRAINT PK_UsersId PRIMARY KEY,
	[User] VARCHAR(50) NOT NULL,
	UserName VARCHAR(50) NOT NULL,
	UserTypeId smallint NOT NULL CONSTRAINT FK_UsersTypeId FOREIGN KEY REFERENCES UserType(Id),
	Email VARCHAR(50) NULL,
	Password VARBINARY(MAX),
	Salt VARBINARY(MAX)
)

CREATE TABLE Products
(
	Id bigint identity(1,1) NOT NULL,
	ProductCode BIGINT NOT NULL CONSTRAINT PK_ProductsCode PRIMARY KEY,
	Value DECIMAL(18,2) NOT NULL,
	MeasureUnit VARCHAR(20) NULL
)

CREATE TABLE Stock
(
	Id bigint identity(1,1) NOT NULL,
	ProductCode bigint NOT NULL CONSTRAINT FK_StockProductCode FOREIGN KEY REFERENCES Products(ProductCode),
	Quantity int NOT NULL
)

CREATE TABLE PaymentMethods
(
	Id smallint identity(1,1) NOT NULL CONSTRAINT PK_PaymentMethodsId PRIMARY KEY,
	Type VARCHAR(50) NOT NULL,
	Tax DECIMAL(3,2) NOT NULL
)

CREATE TABLE [Order]
(
	Id bigint identity(1,1) NOT NULL CONSTRAINT PK_OrderId PRIMARY KEY,
	ProductCode bigint NOT NULL CONSTRAINT FK_OrderProductCode FOREIGN KEY REFERENCES Products(ProductCode),
	UserId bigint NOT NULL CONSTRAINT FK_OrderUserId FOREIGN KEY REFERENCES Users(Id),
	PaymentType smallint NOT NULL CONSTRAINT FK_OrderPaymentType FOREIGN KEY REFERENCES PaymentMethods(Id),
	Quantity int NOT NULL,
	TotalValue decimal(18,2) NOT NULL,
	OccurrenceDate datetime
)