-- create a database login name ddab with a password dab
CREATE LOGIN dab WITH PASSWORD = 'dab';

--create a database user with login dab in the database adventureworsk2017
USE adventureworks2017;
GO

CREATE USER dab FOR LOGIN dab;

-- grant the user db_datareader
ALTER ROLE db_datareader ADD MEMBER [dab];
