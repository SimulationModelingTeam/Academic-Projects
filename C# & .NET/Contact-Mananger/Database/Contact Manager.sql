USE [master]
GO
/****** Object:  Database [Contact Manager]    Script Date: 1/27/2014 6:27:58 PM ******/
CREATE DATABASE [Contact Manager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Contact Manager', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Contact Manager.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Contact Manager_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Contact Manager_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Contact Manager] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Contact Manager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Contact Manager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Contact Manager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Contact Manager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Contact Manager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Contact Manager] SET ARITHABORT OFF 
GO
ALTER DATABASE [Contact Manager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Contact Manager] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Contact Manager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Contact Manager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Contact Manager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Contact Manager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Contact Manager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Contact Manager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Contact Manager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Contact Manager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Contact Manager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Contact Manager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Contact Manager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Contact Manager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Contact Manager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Contact Manager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Contact Manager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Contact Manager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Contact Manager] SET RECOVERY FULL 
GO
ALTER DATABASE [Contact Manager] SET  MULTI_USER 
GO
ALTER DATABASE [Contact Manager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Contact Manager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Contact Manager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Contact Manager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Contact Manager', N'ON'
GO
USE [Contact Manager]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](32) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address_Line]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address_Line](
	[address] [int] NOT NULL,
	[line_number] [int] NOT NULL,
	[line] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Address_Line] PRIMARY KEY CLUSTERED 
(
	[address] ASC,
	[line_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](32) NOT NULL,
	[middle_name] [varchar](32) NULL,
	[last_name] [varchar](32) NULL,
	[gender] [varchar](1) NULL,
	[birthdate] [date] NULL,
	[alias] [varchar](32) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact_Address]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Address](
	[contact] [int] NOT NULL,
	[address] [int] NOT NULL,
 CONSTRAINT [PK_Contact_Address] PRIMARY KEY CLUSTERED 
(
	[contact] ASC,
	[address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Email]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Email](
	[contact] [int] NOT NULL,
	[email] [int] NOT NULL,
 CONSTRAINT [PK_Contact_Email] PRIMARY KEY CLUSTERED 
(
	[contact] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_Notes]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_Notes](
	[contact] [int] NOT NULL,
	[notes] [text] NOT NULL,
 CONSTRAINT [PK_Contact_Notes] PRIMARY KEY CLUSTERED 
(
	[contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact_PhoneNumber]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_PhoneNumber](
	[contact] [int] NOT NULL,
	[phone_number] [int] NOT NULL,
 CONSTRAINT [PK_Contact_PhoneNumber] PRIMARY KEY CLUSTERED 
(
	[contact] ASC,
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Email](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](128) NOT NULL,
	[type] [varchar](16) NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Extension_Number]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Extension_Number](
	[phone_number] [int] NOT NULL,
	[extension_number] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Extension_Number] PRIMARY KEY CLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](32) NOT NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[International_Number]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[International_Number](
	[phone_number] [int] NOT NULL,
	[international_number] [varchar](16) NOT NULL,
 CONSTRAINT [PK_International_Number] PRIMARY KEY CLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[contact] [int] NOT NULL,
	[group] [int] NOT NULL,
	[position] [varchar](32) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[contact] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[creation_date] [datetime] NOT NULL,
	[name] [varchar](32) NOT NULL,
	[memo] [text] NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[time_interval] [datetime] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[creation_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification_Contact]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Contact](
	[notification] [datetime] NOT NULL,
	[contact] [int] NOT NULL,
 CONSTRAINT [PK_Notification_Contact] PRIMARY KEY CLUSTERED 
(
	[notification] ASC,
	[contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification_Group]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_Group](
	[notification] [datetime] NOT NULL,
	[group] [int] NOT NULL,
 CONSTRAINT [PK_Notification_Group] PRIMARY KEY CLUSTERED 
(
	[notification] ASC,
	[group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone_Number]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone_Number](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](16) NULL,
	[local_number] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Phone_Number] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_creation_date]  DEFAULT (getdate()) FOR [creation_date]
GO
ALTER TABLE [dbo].[Address_Line]  WITH CHECK ADD  CONSTRAINT [FK_Address_Line] FOREIGN KEY([address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Address_Line] CHECK CONSTRAINT [FK_Address_Line]
GO
ALTER TABLE [dbo].[Contact_Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Contact] FOREIGN KEY([address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Contact_Address] CHECK CONSTRAINT [FK_Address_Contact]
GO
ALTER TABLE [dbo].[Contact_Address]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Address] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Contact_Address] CHECK CONSTRAINT [FK_Contact_Address]
GO
ALTER TABLE [dbo].[Contact_Email]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Email] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Contact_Email] CHECK CONSTRAINT [FK_Contact_Email]
GO
ALTER TABLE [dbo].[Contact_Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_Contact] FOREIGN KEY([email])
REFERENCES [dbo].[Email] ([id])
GO
ALTER TABLE [dbo].[Contact_Email] CHECK CONSTRAINT [FK_Email_Contact]
GO
ALTER TABLE [dbo].[Contact_Notes]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Notes] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Contact_Notes] CHECK CONSTRAINT [FK_Contact_Notes]
GO
ALTER TABLE [dbo].[Contact_PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_Contact_PhoneNumber] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Contact_PhoneNumber] CHECK CONSTRAINT [FK_Contact_PhoneNumber]
GO
ALTER TABLE [dbo].[Contact_PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_PhoneNumber_Contact] FOREIGN KEY([phone_number])
REFERENCES [dbo].[Phone_Number] ([id])
GO
ALTER TABLE [dbo].[Contact_PhoneNumber] CHECK CONSTRAINT [FK_PhoneNumber_Contact]
GO
ALTER TABLE [dbo].[Extension_Number]  WITH CHECK ADD  CONSTRAINT [FK_Extension_Number] FOREIGN KEY([phone_number])
REFERENCES [dbo].[Phone_Number] ([id])
GO
ALTER TABLE [dbo].[Extension_Number] CHECK CONSTRAINT [FK_Extension_Number]
GO
ALTER TABLE [dbo].[International_Number]  WITH CHECK ADD  CONSTRAINT [FK_International_Number] FOREIGN KEY([phone_number])
REFERENCES [dbo].[Phone_Number] ([id])
GO
ALTER TABLE [dbo].[International_Number] CHECK CONSTRAINT [FK_International_Number]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Contact] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Contact]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Group] FOREIGN KEY([group])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Group]
GO
ALTER TABLE [dbo].[Notification_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Notification] FOREIGN KEY([contact])
REFERENCES [dbo].[Contact] ([id])
GO
ALTER TABLE [dbo].[Notification_Contact] CHECK CONSTRAINT [FK_Contact_Notification]
GO
ALTER TABLE [dbo].[Notification_Contact]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Contact] FOREIGN KEY([notification])
REFERENCES [dbo].[Notification] ([creation_date])
GO
ALTER TABLE [dbo].[Notification_Contact] CHECK CONSTRAINT [FK_Notification_Contact]
GO
ALTER TABLE [dbo].[Notification_Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Notification] FOREIGN KEY([group])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Notification_Group] CHECK CONSTRAINT [FK_Group_Notification]
GO
ALTER TABLE [dbo].[Notification_Group]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Group] FOREIGN KEY([notification])
REFERENCES [dbo].[Notification] ([creation_date])
GO
ALTER TABLE [dbo].[Notification_Group] CHECK CONSTRAINT [FK_Notification_Group]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [CK_Notification] CHECK  (([start_date]<[end_date] OR [end_date] IS NULL))
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [CK_Notification]
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Address]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_delete_Address]
	@addressID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Delete the Address Line Linked to the specified Address
	DELETE FROM Address_Line WHERE [address] = @addressID

    -- Delete the Contact -> Address Relation Linked to the specified Address
    DELETE FROM Contact_Address WHERE [address] = @addressID

    -- Delete the Address once all References have been Removed
    DELETE FROM [Address] WHERE id = @addressID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Contact]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_delete_Contact]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT OFF added enable Counting
	SET NOCOUNT OFF;

	-- Determine all Phone Numbers with a Single Link to the specified Contact
	CREATE TABLE #PhoneNumbers (phone_number INT NOT NULL PRIMARY KEY)

	INSERT #PhoneNumbers (phone_number)
		SELECT phone_number
		FROM Contact_PhoneNumber
		WHERE phone_number IN
		(
			SELECT phone_number
			FROM Contact_PhoneNumber
			GROUP BY phone_number
			HAVING COUNT(*) = 1
		)
		AND contact = @contactID

	-- Declare Loop Variables
	DECLARE @i int = 0
	DECLARE @count int = (SELECT COUNT(*) FROM #PhoneNumbers)

	-- Delete all Phone Numbers with a Single Link to the specified Contact
	WHILE (@i < @count)
	BEGIN
		EXEC sp_delete_PhoneNumber
		(
			SELECT phone_number, ROW_NUMBER()
				OVER (ORDER BY phone_number) AS row_num
			FROM #PhoneNumbers
			WHERE row_num = @i
		)

		SET @i = @i + 1
	END
	
	-- Determine all Addresses with a Single Link to the specified Contact

--	CREATE TABLE #Addresses ([address] INT NOT NULL PRIMARY KEY)

--	INSERT #Addresses ([address])
--		SELECT [address]
--		FROM Contact_Address
--		WHERE [address] IN
--		(
--			SELECT [address]
--			FROM Contact_Address
--			GROUP BY [address]
--			HAVING COUNT(*) = 1
--		)
--		AND contact = @contactID

	-- Reset Loop Variables
--	SET @i = 0
--	SET @count = (SELECT COUNT(*) FROM #Addresses)

	-- Delete all Addresses with a Single Link to the specified Contact
--	WHILE (@i < @count)
--	BEGIN
--		EXEC sp_delete_Address
--		(
--			SELECT [address], ROW_NUMBER()
--				OVER (ORDER BY [address]) AS row_num
--			FROM #Addresses
--			WHERE row_num = @i
--		)

--		SET @i = @i + 1
--	END

	-- Determine all Emails with a Single Link to the specified Contact
--	CREATE TABLE #Emails (email INT NOT NULL PRIMARY KEY)

--	INSERT #Emails (email)
--		SELECT email
--		FROM Contact_Email
--		WHERE email IN
--		(
--			SELECT email
--			FROM Contact_Email
--			GROUP BY email
--			HAVING COUNT(*) = 1
--		)
--		AND contact = @contactID

	-- Reset Loop Variables
--	SET @i = 0
--	SET @count = (SELECT COUNT(*) FROM #Emails)

	-- Delete all Emails with a Single Link to the specified Contact
--	WHILE (@i < @count)
--	BEGIN
--		EXEC sp_delete_Email
--		(
--			SELECT email, ROW_NUMBER()
--				OVER (ORDER BY email) AS row_num
--			FROM #Emails
--			WHERE row_num = @i
--		)

--		SET @i = @i + 1
--	END

	-- Determine all Groups with a Single Link to the specified Contact
--	CREATE TABLE #Groups ([group] INT NOT NULL PRIMARY KEY)

--	INSERT #Groups ([group])
--		SELECT [group]
--		FROM Member
--		WHERE [group] IN
--		(
--			SELECT [group]
--			FROM Member
--			GROUP BY [group]
--			HAVING COUNT(*) = 1
--		)
--		AND contact = @contactID

	-- Reset Loop Variables
--	SET @i = 0
--	SET @count = (SELECT COUNT(*) FROM #Groups)

	-- Delete all Groups with a Single Link to the specified Contact
--	WHILE @i < @count
--	BEGIN
--		EXEC sp_delete_Group
--		(
--			SELECT [group], ROW_NUMBER()
--				OVER (ORDER BY [group]) AS row_num
--			FROM #Emails
--			WHERE row_num = @i
--		)

--		SET @i = @i + 1
--	END

	-- Delete all Chaining References using the specified Contact
	DELETE FROM Contact_PhoneNumber WHERE contact = @contactID
--	DELETE FROM Contact_Address WHERE contact = @contactID
--	DELETE FROM Contact_Email WHERE contact = @contactID
--	DELETE FROM Member WHERE contact = @contactID

	-- Delete the Contact once all References have been Removed
	DELETE FROM Contact WHERE id = @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Email]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_delete_Email]
	@emailID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Delete the Contact -> Email Relation Linked to the specified Email
    DELETE FROM Contact_Email WHERE email = @emailID

    -- Delete the Email once all References have been Removed
    DELETE FROM Email WHERE id = @emailID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Group]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_delete_Group]
	@groupID INT
AS
BEGIN
    -- Delete the Members Linked to the specified Group
    DELETE FROM Member WHERE [group] = @groupID

    -- Delete the Notification -> Group Relation Linked to the specified Group
    DELETE FROM Notification_Group WHERE [group] = @groupID

    -- Remove the Phone Number Entry
    DELETE FROM [Group] WHERE id = @groupID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_delete_PhoneNumber]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_delete_PhoneNumber]
	@phoneNumberID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Delete the International Number Linked to the specified Phone Number
	DELETE FROM International_Number WHERE phone_number = @phoneNumberID

	-- Delete the Extension Number Linked to the specified Phone Number
	DELETE FROM Extension_Number WHERE phone_number = @phoneNumberID

	-- Delete the Contact -> Phone Number Relation Linked to the specified Phone Number
	DELETE FROM Contact_PhoneNumber WHERE phone_number = @phoneNumberID

	-- Delete the Phone Number once all References have been Removed
	DELETE FROM Phone_Number WHERE id = @phoneNumberID
END

GO
/****** Object:  StoredProcedure [dbo].[sp_selectExclude_Address]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectExclude_Address]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Address Information not connected to the specified Contact
	SELECT id AS 'ID',
		   [type] AS 'Type',
		   line AS 'First Line'
	FROM Address
		LEFT JOIN Address_Line ON id = Address_Line.address
		LEFT JOIN Contact_Address ON id = Contact_Address.address
	WHERE line_number = 1
		AND contact <> @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectExclude_Email]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectExclude_Email]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Email Information not connected to the specified Contact
	SELECT id AS 'ID',
		   [type] AS 'Type',
		   Email.email AS 'Email'
	FROM Email
		JOIN Contact_Email ON id = Contact_Email.email
	WHERE contact <> @contactID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectExclude_PhoneNumber]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectExclude_PhoneNumber]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Phone Number Information not connected to the specified Contact
	SELECT id AS 'ID',
		   [type] AS 'Type',
		   local_number AS 'Local Number',
		   international_number AS 'International Number',
		   extension_number AS 'Extension Number'
	FROM Phone_Number
		LEFT JOIN International_Number ON id = International_Number.phone_number
		LEFT JOIN Extension_Number ON id = Extension_Number.phone_number
		LEFT JOIN Contact_PhoneNumber ON id = Contact_PhoneNumber.phone_number
	WHERE contact <> @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectInclude_Address]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectInclude_Address]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Address Information connected to the specified Contact
	SELECT [Address].id AS 'ID',
		   [type] AS 'Type',
		   line AS 'First Line'
	FROM Contact
		JOIN Contact_Address ON Contact.id = contact
		JOIN Address ON Address.id = Contact_Address.address
		JOIN Address_Line ON Address.id = Address_Line.address
	WHERE line_number = 1
		AND Contact.id = @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectInclude_Email]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectInclude_Email]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Email Information connected to the specified Contact
	SELECT Email.id AS 'ID',
		type AS 'Type',
		Email.email AS 'Email Address'
	FROM Contact
		JOIN Contact_Email ON Contact.id = contact
		JOIN Email ON Email.id = Contact_Email.email
	WHERE Contact.id = @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectInclude_Group]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectInclude_Group]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Group Information connected to the specified Contact
	SELECT [Group].id AS 'ID',
		name AS 'Name',
		position AS 'Position',
		[description] AS 'Description'
	FROM Contact
		JOIN Member ON Contact.id = contact
		JOIN [Group] ON [Group].id = Member.[group]
	WHERE Contact.id = @contactID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_selectInclude_PhoneNumber]    Script Date: 1/27/2014 6:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Define the Procedure
CREATE PROCEDURE [dbo].[sp_selectInclude_PhoneNumber]
	@contactID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Select Phone Number Information connected to the specified Contact
	SELECT Phone_Number.id AS 'ID',
		   [type] AS 'Type',
		   local_number AS 'Local Number',
		   international_number AS 'International Number',
		   extension_number AS 'Extension Number'
	FROM Contact
		JOIN Contact_PhoneNumber ON Contact.id = contact
		JOIN Phone_Number ON Phone_Number.id = Contact_PhoneNumber.phone_number
		LEFT JOIN International_Number ON International_Number.phone_number = Phone_Number.id
		LEFT JOIN Extension_Number ON Extension_Number.phone_number = Phone_Number.id
	WHERE Contact.id = @contactID;
END
GO
USE [master]
GO
ALTER DATABASE [Contact Manager] SET  READ_WRITE 
GO
