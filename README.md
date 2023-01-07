# European countries database
**Purpose:**        Database and its interface

**Authors:**        Group 10 (NOTE THIS WAS A GROUP PROJECT DONE IN FALL 2022)

**Program Files included:**  group10.db, group10.sql, group10.java, makefile, sqlite-jdbc-3.39.3.0, readMe.MD, readMe.pdf

---
# How To Run The Program
1. Uzip the group10 folder submitted, verify all above files are included.
2. Open command line and specify directory containing group10 files (i.e., cd group10).
3. Run command => ```make``` in cmdline. Sample output => ```javac group10.java``` will be displayed on the terminal.  
4. Run command => ```make run``` in cmdline 
Sample output => ```java -cp .:sqlite-jdbc-3.39.3.0.jar group10```   
    ``` Welcome To Group 10 European Database! Type h for List of queries. db >``` will be displayed on the terminal. 
5. In the displayed termnial UI press h to see the list of commands and
Sample output below will be displayed on the terminal. => 
    
        Welcome To Group 10 European Database! Type h for List of queries. db > h
        Europen countries database Commands
            h - Get help 
            c <name> - Search for a country
            eu - Countries that are members of the EU
            noteu - Countries that are NOT members of the EU
            gdp - Shows country with max GDP and country with min GDP
            ta - Shows the top 10 airports in Europe
            a <IATACODE> - Search for an airport by iatacode like IST for Istanbul
            fh - All countries with female head of government
            scc <ISOCode> - Search for countries by currency code like EUR for Euro
            ne - EU members that do not use the Euro
            e <amount> - Show European countries with export val > certain amount in millions
            te - Europes top 10 exporting countries
            mulc - Show countries that have more than one currency
            cmto - Show currencies that are used in more than one country
            nn - Show countries with no neighbours
            sn <country> - Show the neighbours of a country
            ssc - Show list of countries that do not have neighbours in the EU
            q - Exit the program
        ---- end help ----- 
6. From above list of cmds select which ever cmd you want to do analysis for.


___
# Note:
1. Above steps work on wsl or any linux machine
**Have a wonderful day!**



