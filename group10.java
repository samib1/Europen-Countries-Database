import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedReader;
import java.util.Scanner;

public class group10 {
    static Connection connection;

    public static void main(String[] args) throws Exception {

        // startup sequence
        MyDatabase db = new MyDatabase();
        runConsole(db);

        System.out.println("Exiting...");
    }

    public static void runConsole(MyDatabase db) {

        Scanner console = new Scanner(System.in);
        System.out.print("\tWelcome To Group 10 European Database! Type h for List of queries. ");
        System.out.print("db > ");
        String line = console.nextLine();
        String[] parts;
        String arg = "";

        while (line != null && !line.equals("q")) {
            parts = line.split("\\s+");
            if (line.indexOf(" ") > 0)
                arg = line.substring(line.indexOf(" ")).trim();

            if (parts[0].equals("h"))
                printHelp();

            else if (parts[0].equals("c")) {
                if (parts.length >= 2)
                    db.countrySearch(arg);
                else
                    System.out.println("Require a country argument for this command");
            }

            else if (parts[0].equals("eu")) {
                db.euMembers();
            }

            else if (parts[0].equals("noteu")) {
                db.notEu();
            }

            else if (parts[0].equals("gdp")) {
                db.gdp();
            }

            else if (parts[0].equals("ta")) {
                db.top10Airports();
            }

            else if (parts[0].equals("a")) {
                if (parts.length >= 2)
                    db.lookupAirport(arg);
                else
                    System.out.println("Require an IATACode for this command");
            }

            else if (parts[0].equals("fh")) {
                db.femaleHeadOfGov();
            }

            else if (parts[0].equals("scc")) {
                if (parts.length >= 2)
                    db.useCurrency(arg);
                else
                    System.out.println("Require an argument for this command");
            }

            else if (parts[0].equals("ne")) {
                db.doesNotUseEuro();
            }

            else if (parts[0].equals("e")) {
                try {
                    if (parts.length >= 2)
                        db.exportGreaterThan(arg);
                    else
                        System.out.println("Require an argument for this command");
                } catch (Exception e) {
                    System.out.println("amount must be an integer");
                }
            }

            else if (parts[0].equals("te")) {
                db.top10Exporters();
            } else if (parts[0].equals("mulc")) {
                db.MultipleCurrencies();
            } else if (parts[0].equals("cmto")) {
                db.multipleCountries();
            } else if (parts[0].equals("nn"))
                db.countriesWithNoNeighbours();
            else if (parts[0].equals("sn")) {
                if (parts.length >= 2)
                    db.showNeighbours(arg);
                else
                    System.out.println("Require an argument for this command");
            } else if (parts[0].equals("ssc"))
                db.showAllEUNeighbours();
            else
                System.out.println("Read the help with h, or find help somewhere else.");

            System.out.print("db > ");
            line = console.nextLine();
        }

        console.close();
    }

    private static void printHelp() {
        System.out.println("Europen countries database Commands");
        // System.out.println("Commands:");
        System.out.println("\th - Get help");

        System.out.println("\tc <name> - Search for a country");

        System.out.println("\teu - Countries that are members of the EU");
        System.out.println("\tnoteu - Countries that are NOT members of the EU");

        System.out.println("\tgdp - Shows country with max GDP and country with min GDP");

        System.out.println("\tta - Shows the top 10 airports in Europe");
        System.out.println("\ta <IATACODE> - Search for an airport by iatacode like IST for Istanbul");

        System.out.println("\tfh - All countries with female head of government");

        System.out.println("\tscc <ISOCode> - Search for countries by currency code like EUR for Euro");
        System.out.println("\tne - EU members that do not use the Euro");

        System.out.println("\te <amount> - Show European countries with export val > certain amount in millions");
        System.out.println("\tte - Europes top 10 exporting countries");
        System.out.println("\tmulc - Show countries that have more than one currency");
        System.out.println("\tcmto - Show currencies that are used in more than one country");
        System.out.println("\tnn - Show countries with no neighbours");
        System.out.println("\tsn <country> - Show the neighbours of a country");
        System.out.println("\tssc - Show list of countries that do not have neighbours in the EU");

        System.out.println("");

        System.out.println("\tq - Exit the program");

        System.out.println("---- end help ----- ");
    }

}

class MyDatabase {
    private Connection connection;

    public MyDatabase() {
        try {
            String url = "jdbc:sqlite:group10.db";
            // create a connection to the database
            connection = DriverManager.getConnection(url);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

    }

    public void countrySearch(String name) {
        /* Return that countries information using countries table */
        try {
            System.out.println("\t\t\t\tSearch results for " + name);
            System.out.println("\tName \t|Population \t|Capital City \t|GDP \t|In EU \t|Region name");
            System.out.println("\t---------------------------------------------------------------------------------");

            String sql = "Select * from Countries where name like ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, "%" + name + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String EUresult;
                int inEU = rs.getInt("EUMember");
                if (inEU == 1) {
                    EUresult = "YES";
                } else {
                    EUresult = "NO";
                }
                System.out.println("\t" + rs.getString("name")
                        + "\t|" + rs.getString("population")
                        + "\t|" + rs.getString("capitalCity")
                        + "\t\t|" + rs.getInt("GDP")
                        + "\t|" + EUresult
                        + "\t|" + rs.getString("regionName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }

    }

    public void euMembers() {
        /* Return all countries that are part of the EU ordered in alphabetical order */
        try {
            System.out.println("\t\t\t\tCountries that are a part of EU:");
            System.out.println("\tName \t\t|Population \t|Capital City \t|GDP \t|Region name");
            System.out.println("\t----------------------------------------------------------------------");

            String sql = "select * from Countries where eumember = 1 order by name";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("name")
                        + "\t\t|" + rs.getString("population")
                        + "\t|" + rs.getString("capitalCity")
                        + "\t\t|" + rs.getInt("GDP")
                        + "\t|" + rs.getString("regionName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }

    }

    public void notEu() {
        /*
         * Return all countries that are not part of the EU ordered in alphabetical
         * order
         */
        try {
            System.out.println("\t\t\t\tCountries that are a part of EU:");
            System.out.println("\tName \t\t|Population \t|Capital City \t|GDP \t|Region name");
            System.out.println("\t------------------------------------------------------------------------------");

            String sql = "select * from Countries where eumember = 0 order by name";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("name")
                        + "\t\t|" + rs.getString("population")
                        + "\t|" + rs.getString("capitalCity")
                        + "\t\t|" + rs.getInt("GDP")
                        + "\t|" + rs.getString("regionName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }

    }

    public void gdp() {
        /* Show country with max gdp and country with min gdp */
        try {
            System.out.println("\t\t\t\tCountries with the largest and smallest gdp:");
            System.out.println("\tName \t\t|Population \t|Capital City \t|GDP \t|Region name \t|Ranking");
            System.out.println("\t--------------------------------------------------------------------------------------------------");

            String sql = "select *,max(gdp) from Countries union select *, min(gdp) from Countries order by gdp";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            String TEXT = "Smallest";
            while (rs.next()) {
                System.out.println("\t" + rs.getString("name")
                        + "\t\t|" + rs.getString("population")
                        + "\t|" + rs.getString("capitalCity")
                        + "\t\t|" + rs.getInt("GDP")
                        + "\t|" + rs.getString("regionName")
                        + "\t|" + TEXT);
                TEXT = "Largest";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }
    }

    public void top10Airports() {
        /* Show the top 10 airports in Europe */
        try {
            System.out.println("\t\t\tTOP 10 AIRPORTS IN EUROPE");
            System.out.println("\tRank \t|Country \t\t|IATA \t|Airport Name \t\t\t\t|Passengers Served 2021");
            System.out.println(
                    "\t-----------------------------------------------------------------------------------------------------------");

            String sql = "select * from biggestAirports where rank<=10";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("rank")
                        + " \t|" + rs.getString("countryName")
                        + " \t\t|" + rs.getString("iataCode")
                        + " \t|" + rs.getString("airportName")
                        + " \t\t\t|" + rs.getString("passengers"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }
    }

    public void lookupAirport(String id) {
        /* Search for an airport using IATACode */
        try {
            System.out.println("\tSEARCHING FOR AIRPORT WITH IATACODE => " + id);
            System.out.println("\tRank \t|Airport Name \t\t\t\t|IATA \t|Country");
            System.out.println("\t----------------------------------------------------------------------");

            String sql = "Select * from biggestAirports where iataCode like ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, "%" + id + "%");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("rank")
                        + " \t|" + rs.getString("airportName")
                        + " \t\t\t|" + rs.getString("iataCode")
                        + " \t|" + rs.getString("countryName"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }
    }

    public void femaleHeadOfGov() {
        /* Show the countries with only female heads of government */
        try {
            System.out.println("\t\tEUROPEN COUNTRIES WITH FEMALE HEADS OF GOVERNMENT");
            System.out.println("\tCountry \t|Title \t\t\t|Name");
            System.out.println("\t------------------------------------------------------------");

            String sql = "select * from headOfGovernment where gender =\"Female\" order by countryName";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("countryName")
                        + " \t|" + rs.getString("jobTitle")
                        + " \t|" + rs.getString("firstName") + " " + rs.getString("lastName")

                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }

    }

    public void useCurrency(String ISOCode) {
        /* Show all countries that use same currency */
        ISOCode = ISOCode.toUpperCase();
        try {
            System.out.println("\t\t  Countries that use the " + ISOCode + " currency");
            System.out.println("\t\t\t\tCountry");
            System.out.println(
                    "\t\t\t----------------------");

            String sql = "select country from OfficialCurrencies where ISOCode=?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, ISOCode);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t\t\t\t" + rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }
    }

    public void doesNotUseEuro() {
        /* Show EU members that do not use the Euro */

        try {
            String sql = "select name, ISOCode, currencyName\n" +
                    "from Countries\n" +
                    " join OfficialCurrencies on Countries.name = OfficialCurrencies.country\n" +
                    " natural join Currency\n" +
                    "where EUMember = 1 and ISOCode != \"EUR\";";

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            System.out.println("\tEU COUNTRIES THAT DO NOT USE THE EURO");
            System.out.println("\tCountry \t|ISOCode \t|Currency name");
            System.out.println("\t-------------------------------------------------------");

            while (resultSet.next()) {
                System.out.println(
                        "\t" + resultSet.getString("name")
                                + "\t\t|" + resultSet.getString("ISOCode")
                                + "\t\t|" + resultSet.getString("currencyName")
                                );

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void MultipleCurrencies() {
        /* Show countries that have more than one currency */
        try {
            System.out.println("\t\t  Countries that have more than one currency");
            System.out.println("\t\t\t\tCountry");
            System.out.println(
                    "\t\t\t----------------------");

            String sql = " select country from OfficialCurrencies group by country having count(ISOCode) > 1; ";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t\t\t\t" + rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }
    }

    public void multipleCountries() {
        try {
            System.out.println("\t\tCurrencies that are used in more than one country");
            System.out.println("\tISO Code \t|Currency Name \t|No of countries");
            System.out.println("\t------------------------------------------------------");

            String sql = "select ISOCode, currencyName, count(country) as Total from OfficialCurrencies natural join currency group by ISOCode having total > 1";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                System.out.println("\t" + rs.getString("ISOCode")
                        + " \t\t|" + rs.getString("currencyName")
                        + " \t\t|" + rs.getString("Total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // e.printStackTrace(System.out);
        }

    }

    public void exportGreaterThan(String amountStr) {
        /* show european countries with export val > certain amount */

        try {
            String sql = "select * from Export\n" +
                    "where amount > ?";

            try {
                double amount = Double.parseDouble(amountStr);

                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setDouble(1, amount);

                ResultSet set = statement.executeQuery();

                if (!set.isBeforeFirst()) // check if there are any results. Let the user know if there are non
                    System.out.println("There are no countries that export more than " + amountStr + "million USD");
                else {
                    System.out.println("\tCOUNTRIES THAT EXPORT MORE THAN " + amountStr + " MILLION USD");
                    System.out.println("\tCountry \t|Amount in million USD");
                    System.out.println("\t----------------------------------------");
                    while (set.next()) {
                        System.out.println("\t" + set.getString("countryName") + "\t\t|" + set.getDouble("amount"));
                    }
                }
            } catch (NumberFormatException n) {
                System.out.println("Input must be a real number.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void top10Exporters() {
        /* Show europe's top 10 exporting countries */

        try {
            String sql = "select * from Export\n" +
                    "order by amount desc\n" +
                    "limit 10;";

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet set = statement.executeQuery();

            System.out.println("\tTOP TEN EUROPEAN EXPORTERS");
            System.out.println("\tRank \t|Country \t|Amount in million USD");
            System.out.println("\t----------------------------------------------");
            int i = 1;
            while (set.next()) {
                System.out.println("\t" + i + " \t|" + set.getString("countryName") + "\t\t|" + set.getDouble("amount"));
                i++;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void countriesWithNoNeighbours() {
        try {
            String sql = "select name from Countries cOut\n" +
                    "where name not in (\n" +
                    "\tselect countryA \n" +
                    "\tfrom Neighbours\n" +
                    "\tUNION \n" +
                    "\tselect countryB\n" +
                    "\tfrom Neighbours\n" +
                    ");";

            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            System.out.println("\tTHESE ARE THE COUNTRIES THAT HAVE NO NEIGHBOURS");
            System.out.println("\t----------------------------------------------");
            while (resultSet.next())
                System.out.println("\t\t" + resultSet.getString("name"));

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void showNeighbours(String country) {
        /* Show neighbours of a passed country */

        try {
            String sql = "select countryB as Neighbour from Countries\n" +
                    "join Neighbours on Countries.name = Neighbours.countryA\n" +
                    "where upper(name) = upper(?)\n" +
                    "\n" +
                    "union\n" +
                    "\n" +
                    "select countryA as Neighbours from Countries\n" +
                    "join Neighbours on Countries.name = Neighbours.countryB\n" +
                    "where upper(name) = upper(?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, country);
            statement.setString(2, country);

            ResultSet set = statement.executeQuery();

            if (!set.isBeforeFirst())
                System.out.println("There are no neighbours of" + country + "\n or such country does not exist.");
            else {
                System.out.println("\t\tNEIGHBOURS OF " + country);
                System.out.println("\t-------------------------------------");
                
                while (set.next()) {
                    System.out.println("\t\t" + set.getString("Neighbour"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void showAllEUNeighbours() {
        /* Show all countries who's all neighbours are part of the EU */

        try {
            String sql = "select name from Countries cOUt\n" +
                    "where not exists\n" +
                    "\n" +
                    "(\n" +
                    "select countryA \n" +
                    "from Neighbours \n" +
                    "join Countries on Neighbours.countryB = Countries.name\n" +
                    "where cOut.name = countryA\n" +
                    "and Countries.EUMember = 0 \n" +
                    "\n" +
                    "UNION\n" +
                    "\n" +
                    "select countryB\n" +
                    "from Neighbours \n" +
                    "join Countries on Neighbours.countryA = Countries.name\n" +
                    "where cOut.name = countryB\n" +
                    "and Countries.EUMember = 0 \n" +
                    ")\n" +
                    "\n" +
                    "EXCEPT\n" +
                    "\n" +
                    "select name from Countries cOut\n" +
                    "where name not in (\n" +
                    "\tselect countryA \n" +
                    "\tfrom Neighbours\n" +
                    "\tUNION \n" +
                    "\tselect countryB\n" +
                    "\tfrom Neighbours\n" +
                    ");\n";

            PreparedStatement statement = connection.prepareStatement(sql);

            System.out.println("\tTHIS IS A LIST OF COUNTRIES THAT DO NOT HAVE NEIGHBOURS NOT IN THE EU");
            System.out.println("\t---------------------------------------------------------------------");
            ResultSet set = statement.executeQuery();
            while (set.next())
                System.out.println("\t\t"+set.getString("name"));

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
