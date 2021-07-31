**Introduction :**

This project is to get detail title information when search for title name in search box. Number of character in search box should be more or equal to 1 to begin search process.
As soon as, the number of character is 1, it starts retrieving top 10 title information from database table Titles, whichever TitleName contains this character. Data is limited to top 10 so the system will not get slow by loading all the titles that matched the character. 

**Tools Used:**

AngularJS 1.8.2 for frontend.
Bootstrap for responsive design. It can be viewable in Mobile , Ipad as well.
SQL database to store Title Information tables.
Web Api in C#
.NET framework 4.7.1
Visual Studio Community 2019
SQL Express 2019

**Features:**

This application is responsive. Gets all title information in tabular format. 

There are 4 projects in this application to provide scalability and extendabilty for future.
1) Data Access Layer Library project  - TitleInformationDAL
2) Model Library Project - TitleInformationModel
3) Main/Web Project - WM_TitleInformationSystem

**Installation Guide: **

   ***Pre-requisites:***
      Install SQL express
      Install Visual Studio Community or any 2019
      Make sure .NET 4.7.1 is installed
      Run SQL query to create database and tables
     
Download the zip and sql files from below link.
WM_TitleInformationSytem.zip
Packages.zip
GetTitleInformationByName.sql

First, extract all zipped files. 
Copy packages folder into the WM_TitleInformationSystem folder
Run Manage Nuget Package Manger to install Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1, which is not inside this package folder due to its huge size.

Now, open the solution file WM_TitleInformationSystem.sln in Visual studio Community 2019. 
Once the solution is open, right click on solution and build.
Then run web project WM_InformationSystem.
It should open a application in browser with a welcome note and search box.

All AngularJS codes are inside Scripts\app folder.
Bootstrap and css classes are inside Content folder.
