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
      Install SQL express,
      Install Visual Studio Community or any 2019,
      Make sure .NET 4.7.1 is installed,
      Run SQL query to create database and tables
     
1. Download the code from below link.
    https://github.com/Shrestha11/Assessment.git

    It will download Assessment-main.zip file in your download folder.

2.  Extract Assessment-main.zip. This will have below files.
      WM_TitleInformationSytem.zip
      Packages.zip
      GetTitleInformationByName.sql
      README.md

3. Extract all zipped files. 
4. Run stored procedure GetTitleInformationByName
5. Open extracted folder WM_TitleInformationSytem.
6. Open solution WM_TitleInformationSytem.sln. It should open the solution in Visual Studio if you already have installed in your machine.
7. Run web project WM_InformationSystem.
8. It should open application in browser with a welcome note and search box.

Just incase, if you need packages, copy packages folder into the WM_TitleInformationSystem folder
Run Manage Nuget Package Manger to install Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1, which is not inside this package folder due to its huge size.

NOTE: 
All AngularJS codes are inside Scripts\app folder.
Bootstrap and css classes are inside Content folder.


