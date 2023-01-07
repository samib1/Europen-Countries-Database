-- CLEAN FORMAT -----------------
-- .mode column
-- .header on
-- --.echo on
-- PRAGMA foreign_keys = 1;
---------------------------------



CREATE TABLE Currency (
ISOCode TEXT,
currencyName TEXT,
RateVsUSD REAL,
PRIMARY KEY(ISOCode)
);

CREATE TABLE Mayor (
FName	TEXT,
LName	TEXT,
CityName     TEXT REFERENCES  City(CityName),
PRIMARY KEY(CityName, LName)
);

create table region(
    regionName text primary key,
    numCountries integer,
    population integer
);


-- city(CityName, population, CountryName) ##pk is CityName, FK is country Name
create table city(
    cityName text primary key,
    population integer,
    countryName text references Countries(name)
);


-- headOfGovernment(FName, LName, gender, CountryName, JobTitle) #pk personID, PK+FK countryname
create table headOfGovernment(
    firstName text not null,
    lastName text not null,
    gender text not null, 
    jobTitle text not null,
    countryName text references Countries(name),
    primary key(firstName, lastName, countryName)
);    


-- biggestAirports(Name, IATACode, CityName, CountryName) #pk symbol, Name, FK city,country
create table biggestAirports(
    rank integer,
    airportName text not null,
    iataCode text,
    cityName text references city(cityName),
    countryName text references Countries(name),
    passengers integer
);


CREATE TABLE Countries (
	name	TEXT,
	population	INTEGER,
	capitalCity	TEXT,
	GDP	NUMERIC,
	EUMember	INTEGER,
	regionName TEXT,
	PRIMARY KEY(name),
	FOREIGN KEY(regionName) REFERENCES region(regionName)
);

CREATE TABLE Neighbours (
	countryA	TEXT REFERENCES  Countries(name),
	countryB	TEXT REFERENCES  Countries(name),
	PRIMARY KEY(countryA,countryB)
);

CREATE TABLE OfficialCurrencies (
country TEXT,
ISOCode TEXT,
PRIMARY KEY(country, ISOCode),
FOREIGN KEY(country) REFERENCES Countries(name)
);


insert into region values ("Western Europe",9,189437316);
insert into region values ("Eastern Europe",10,287959843);
insert into region values ("Northern Europe",10,106402822);
insert into region values ("Southern Europe",15,152438670);
-----------------------------------------------------------------------------

INSERT INTO Countries VALUES 
("Belarus", 9431000, "Minsk", 68.22, 0, "Eastern Europe"),
("Bulgaria", 6890, "Sofia", 80.27, 1, "Eastern Europe"),
("Czech Republic",  10713000, "Prague", 282, 1, "Eastern Europe"),
("Hungary", 9623000, "Budapest", 182, 1, "Eastern Europe"),
("Moldova", 4030000, "Chisinau", 13.68, 0, "Eastern Europe"),
("Poland", 37758000, "Warsaw", 674, 1, "Eastern Europe"),
("Romania", 19125000, "Bucharest", 284, 1, "Eastern Europe"),
("Russia", 145718000, "Moscow", 1776, 0, "Eastern Europe"),
("Slovakia", 5454000, "Bratislava", 115, 1, "Eastern Europe"),
("Ukraine", 43416000, "Kyiv", 200, 0, "Eastern Europe"),
("Georgia",3688000, "Tbilisi",61.58,0, "Eastern Europe"),
("Turkey",11704000,"Ankara",815,0,"Eastern Europe"),
("Denmark",  5813000,  "Copenhagen",  397,  1, "Northern Europe"),
("Estonia",  1323000,  "Tallinn",  36.26,  1, "Northern Europe"),
("Finland",  5551000,  "Helsinki", 299, 1, "Northern Europe"),
("Iceland", 341000, "Reykjavik", 25.46, 0, "Northern Europe"),
("Ireland", 4977000, "Dublin", 499, 1, "Northern Europe"),
("Latvia",  1886000, "Roga", 38.87, 1, "Northern Europe"),
("Lithuania", 2722000, "Vilnius", 65.5, 1, "Northern Europe"),
("Norway",  5421000, "Oslo", 482, 0, "Northern Europe"),
("Sweden", 10160000, "Stockholm", 627, 1, "Northern Europe"),
("Faroe Islands", 49000,"Torshavn", 3.241,0,"Northern Europe"),
("Vatican City", 1000, "Vatican City",0,0,"Northern Europe"),
("United Kingdom", 68178000, "London",3187,0,"Northern Europe"),
("Albania", 2868000, "Tirana", 18.26, 0, "Southern Europe"),
("Andorra", 77000, "Addora la Vella", 3.33, 0, "Southern Europe"),
("Bosnia", 3265000, "Sarajevo", 22.57, 0, "Southern Europe"),
("Croatia", 4079000, "Zagreb", 67.84, 1, "Southern Europe"),
("Greece", 10369000, "Athens", 216, 1, "Southern Europe"),
("Italy", 60394000, "Rome", 2100, 1, "Southern Europe"),
("Macedonia", 2083000,  "Skopje", 13.88, 0, "Southern Europe"),
("Malta", 433000, "Valletta", 17.19, 1, "Southern Europe"),
("Montenegro", 629000, "Podgorica", 5.81, 0, "Southern Europe"),
("Portugal", 10168000, "Lisbon", 250, 1, "Southern Europe"),
("Serbia", 8694000, "Belgrade", 63.07, 0, "Southern Europe"),
("Slovenia", 2079000, "Ljubljana", 61.53, 1, "Southern Europe"),
("Spain", 46726000, "Madrid", 1425, 1, "Southern Europe"),
("Cyprus", 1216000,"Nicosia",27.72,1, "Southern Europe"),
("Austria", 9018000, "Vienna", 477, 1, "Western Europe"),
("Belgium", 11613000, "Brussels", 600, 1, "Western Europe"),
("France", 65375000, "Paris", 2937, 1, "Western Europe"),
("Germany", 83657000,  "Berlin", 4223, 1, "Western Europe"),
("Liechtenstein", 38000, "Vaduz", 6, 0, "Western Europe"),
("Luxembourg", 633000, "Luxembourg", 86.71, 1, "Western Europe"),
("Netherlands", 17157000, "Amsterdam", 1018, 1, "Western Europe"),
("Switzerland", 8704000, "Burn", 813, 0, "Western Europe"),
("Monaco", 40000, "Monaco", 6.82, 0, "Western Europe");

INSERT INTO OfficialCurrencies VALUES 
("Albania", "ALL"),
("Finland", "EUR"),
("Andorra", "EUR"),
("Austria", "EUR"),
("Belarus", "BYN"),
("Belgium", "EUR"),
("Bosnia", "BAM"),
("Bulgaria", "BGN"),
("Croatia", "HRK"),
("Cyprus", "EUR"),
("Czech Republic", "CZK"),
("Denmark", "DKK"),
("Faroe Islands", "DKK"),
("Estonia", "EUR"),
("Denmark", "EUR"),
("France", "EUR"),
("Georgia", "GEL"),
("Germany", "EUR"),
("Greece", "EUR"),
("Hungary", "HUF"),
("Iceland", "ISK"),
("Ireland", "EUR"),
("Italy", "EUR"),
("Latvia", "EUR"),
("Liechtenstein", "CHF"),
("Lithuania", "EUR"),
("Luxembourg", "EUR"),
("Malta", "EUR"),
("Moldova", "MDL"),
("Monaco", "EUR"),
("Montenegro", "EUR"),
("Netherlands", "EUR"),
("Macedonia", "MKD"),
("Norway", "NOK"),
("Poland", "PLN"),
("Portugal", "EUR"),
("Romania", "RON"),
("Russia", "RUB"),
("Serbia", "RSD"),
("Slovakia", "EUR"),
("Slovenia", "EUR"),
("Spain", "EUR"),
("Sweden", "SEK"),
("Switzerland", "CHF"),
("Turkey", "TRY"),
("Ukraine", "UAH"),
("United Kingdom", "GBP"),
("Vatican City", "EUR");

INSERT INTO Currency VALUES
("GBP","British pound",1.19),
("MKD","Macedonian denar",0.0167842248),
("HUF","Hungarian forint",0.0024951407),
("MDL","Moldovan leu",0.052),
("BYN","Belarusian ruble",0.3959822061),
("SEK","Swedish krona",0.094),
("RON","Romanian leu",0.2107170702),
("CZK","Czech koruna",0.042),
("EUR","Euro",1.04),
("NOK","Norwegian krone",0.0986369654),
("DKK","Danish krone",0.1391595349),
("PLN","Polish zloty",0.0220676603),
("GEL","Georgian lari",0.3676470588),
("BGN","Bulgarian lev",0.53),
("ALL","Albanian lek",0.0088),
("TRY","Turkish lira",0.0537476951),
("RUB","Russian ruble",0.017),
("ISK","Icelandic króna",0.0069256874),
("RSD","Serbian dinar",0.0088104988),
("HRK","Croatian kuna",0.14),
("CHF","Swiss franc",1.05),
("UAH","Ukrainian hryvnia",0.027),
("BAM","Bosnia and Herzegovina convertible mark",0.5291411246);

--city iNSERT STATMMENTS  -------------------------------------------------------
insert into city values ("Moscow",10381222,"Russia");
insert into city values ("London",8961989,"United Kingdom");
insert into city values ("Saint Petersburg",5028000,"Russia");
insert into city values ("Berlin",3426354,"Germany");
insert into city values ("Madrid",3255944,"Spain");
insert into city values ("Kyiv",2797553,"Ukraine");
insert into city values ("Rome",2318895,"Italy");
insert into city values ("Paris",2138551,"France");
insert into city values ("Bucharest",1877155,"Romania");
insert into city values ("Minsk",1742124,"Belarus");
insert into city values ("Budapest",1741041,"Hungary");
insert into city values ("Hamburg",1739117,"Germany");
insert into city values ("Warsaw",1702139,"Poland");
insert into city values ("Vienna",1691468,"Austria");
insert into city values ("Barcelona",1621537,"Spain");
insert into city values ("Stockholm",1515017,"Sweden");
insert into city values ("Kharkiv",1430885,"Ukraine");
insert into city values ("Novosibirsk",1419007,"Russia");
insert into city values ("Yekaterinburg",1349772,"Russia");
insert into city values ("Nizhniy Novgorod",1284164,"Russia");
insert into city values ("Belgrade",1273651,"Serbia");
insert into city values ("Munich",1260391,"Germany");
insert into city values ("Milan",1236837,"Italy");
insert into city values ("Prague",1165581,"Czech Republic");
insert into city values ("Copenhagen",1153615,"Denmark");
insert into city values ("Sofia",1152556,"Bulgaria");
insert into city values ("Samara",1134730,"Russia");
insert into city values ("Omsk",1129281,"Russia");
insert into city values ("Kazan",1104738,"Russia");
insert into city values ("Rostov-na-Donu",1074482,"Russia");
insert into city values ("Chelyabinsk",1062919,"Russia");
insert into city values ("Ufa",1033338,"Russia");
insert into city values ("Donetsk",1024700,"Ukraine");
insert into city values ("Dublin",1024027,"Ireland");
insert into city values ("Brussels",1019022,"Belgium");
insert into city values ("Odessa",1013159,"Ukraine");
insert into city values ("Volgograd",1011417,"Russia");
insert into city values ("Dnipro",998103,"Ukraine");
insert into city values ("Birmingham",984333,"United Kingdom");
insert into city values ("Perm",982419,"Russia");
insert into city values ("Koeln",963395,"Germany");
insert into city values ("Naples",959470,"Italy");
insert into city values ("Krasnoyarsk",927200,"Russia");
insert into city values ("Turin",870456,"Italy");
insert into city values ("Liverpool",864122,"United Kingdom");
insert into city values ("Saratov",863725,"Russia");
insert into city values ("Voronezh",848752,"Russia");
insert into city values ("Valencia",814208,"Spain");
insert into city values ("Marseille",794811,"France");
insert into city values ("Lodz",768755,"Poland");
insert into city values ("Krakow",755050,"Poland");
insert into city values ("Riga",742572,"Latvia");
insert into city values ("Amsterdam",741636,"Netherlands");
insert into city values ("Zaporizhzhya",738728,"Ukraine");
insert into city values ("Lviv",717803,"Ukraine");
insert into city values ("Sevilla",703206,"Spain");
insert into city values ("Tolyatti",702879,"Russia");
insert into city values ("Zagreb",698966,"Croatia");
insert into city values ("Sarajevo",696731,"Bosnia");
insert into city values ("Sheffield",685368,"United Kingdom");
insert into city values ("Zaragoza",674317,"Spain");
insert into city values ("Athens",664046,"Greece");
insert into city values ("Frankfurt",650000,"Germany");
insert into city values ("Krasnodar",649851,"Russia");
insert into city values ("Palermo",648260,"Italy");
insert into city values ("Ulyanovsk",640680,"Russia");
insert into city values ("Chisinau",635994,"Moldova");
insert into city values ("Wroclaw",634893,"Poland");
insert into city values ("Izhevsk",631038,"Russia");
insert into city values ("Kryvyy Rih",624579,"Ukraine");
insert into city values ("Bristol",617280,"United Kingdom");
insert into city values ("Yaroslavl",606730,"Russia");
insert into city values ("Barnaul",599579,"Russia");
insert into city values ("Rotterdam",598199,"Netherlands");
insert into city values ("Essen",593085,"Germany");
insert into city values ("Glasgow",591620,"United Kingdom");
insert into city values ("Stuttgart",589793,"Germany");
insert into city values ("Dortmund",588462,"Germany");
insert into city values ("Vladivostok",587022,"Russia");
insert into city values ("Irkutsk",586695,"Russia");
insert into city values ("Genoa",580223,"Italy");
insert into city values ("Oslo",580000,"Norway");
insert into city values ("Khabarovsk",579000,"Russia");
insert into city values ("Khabarovsk Vtoroy",578303,"Russia");
insert into city values ("Duesseldorf",573057,"Germany");
insert into city values ("Goeteborg",572799,"Sweden");
insert into city values ("Poznan",570352,"Poland");
insert into city values ("Malaga",568305,"Spain");
insert into city values ("Helsinki",558457,"Finland");
insert into city values ("Orenburg",550204,"Russia");
insert into city values ("Pristina",550000,"Serbia");
insert into city values ("Bremen",546501,"Germany");
insert into city values ("Vilnius",542366,"Lithuania");
insert into city values ("Novokuznetsk",539616,"Russia");
insert into city values ("Ryazan'",520173,"Russia");
insert into city values ("Tyumen",519119,"Russia");
insert into city values ("Lisbon",517802,"Portugal");
insert into city values ("Lipetsk",515655,"Russia");
insert into city values ("Nuernberg",515543,"Germany");
insert into city values ("Hannover",515140,"Germany");
insert into city values ("Penza",512602,"Russia");
insert into city values ("Naberezhnyye Chelny",509870,"Russia");
insert into city values ("Leicester",508916,"United Kingdom");
insert into city values ("Leipzig",504971,"Germany");
insert into city values ("Kalininskiy",504641,"Russia");
insert into city values ("Duisburg",504358,"Germany");
insert into city values ("Astrakhan",502533,"Russia");
insert into city values ("Makhachkala",497959,"Russia");
insert into city values ("Dresden",486854,"Germany");
insert into city values ("Tomsk",485519,"Russia");
insert into city values ("Mykolayiv",483186,"Ukraine");
insert into city values ("Homyel'",480951,"Belarus");
insert into city values ("Kemerovo",477090,"Russia");
insert into city values ("Skopje",474889,"Macedonia");
insert into city values ("The Hague",474292,"Netherlands");
insert into city values ("Lyon",472317,"France");
insert into city values ("Tula",468825,"Russia");
insert into city values ("Edinburgh",464990,"United Kingdom");
insert into city values ("Sevastopol",464349,"Ukraine");
insert into city values ("Gdansk",461865,"Poland");
insert into city values ("Antwerpen",459805,"Belgium");
insert into city values ("Kirov",457383,"Russia");
insert into city values ("Leeds",455123,"United Kingdom");
insert into city values ("Luhansk",452000,"Ukraine");
insert into city values ("Cardiff",447287,"United Kingdom");
insert into city values ("Cheboksary",446781,"Russia");
insert into city values ("Murcia",436870,"Spain");
insert into city values ("Kaliningrad",434954,"Russia");
insert into city values ("Toulouse",433055,"France");
insert into city values ("Mariupol",431859,"Ukraine");
insert into city values ("Bryansk",427236,"Russia");
insert into city values ("Bratislava",423737,"Slovakia");
insert into city values ("Ivanovo",420839,"Russia");
insert into city values ("Magnitogorsk",413351,"Russia");
insert into city values ("Wandsbek",411422,"Germany");
insert into city values ("Kursk",409431,"Russia");
insert into city values ("Szczecin",407811,"Poland");
insert into city values ("Palma",401270,"Spain");
insert into city values ("Tver",400212,"Russia");
insert into city values ("Manchester",395515,"United Kingdom");
insert into city values ("Tallinn",394024,"Estonia");
insert into city values ("Bochum",385729,"Germany");
insert into city values ("Las Palmas de Gran Canaria",381847,"Spain");
insert into city values ("Nizhny Tagil",381116,"Russia");
insert into city values ("Bochum-Hordel",380000,"Germany");
insert into city values ("Makiivka",376610,"Ukraine");
insert into city values ("Tirana",374801,"Albania");
insert into city values ("Kaunas",374643,"Lithuania");
insert into city values ("Stoke-on-Trent",372775,"United Kingdom");
insert into city values ("Vinnytsya",369839,"Ukraine");
insert into city values ("Brno",369559,"Czech Republic");
insert into city values ("Mahilyow",369200,"Belarus");
insert into city values ("Bydgoszcz",366452,"Poland");
insert into city values ("Bologna",366133,"Italy");
insert into city values ("Stavropol'",363064,"Russia");
insert into city values ("Wuppertal",360797,"Germany");
insert into city values ("Ulan-Ude",360278,"Russia");
insert into city values ("Lublin",360044,"Poland");
insert into city values ("Coventry",359262,"United Kingdom");
insert into city values ("Arkhangel'sk",356051,"Russia");
insert into city values ("Bilbao",354860,"Spain");
insert into city values ("Thessaloniki",354290,"Greece");
insert into city values ("Florence",349296,"Italy");
insert into city values ("Belgorod",345289,"Russia");
insert into city values ("Kurgan",343129,"Russia");
insert into city values ("Vitebsk",342700,"Belarus");
insert into city values ("Zurich",341730,"Switzerland");
insert into city values ("Plovdiv",340494,"Bulgaria");
insert into city values ("Kaluga",338978,"Russia");
insert into city values ("Nice",338620,"France");
insert into city values ("Krasnogvargeisky",337091,"Russia");
insert into city values ("Simferopol",336460,"Ukraine");
insert into city values ("Sunderland",335415,"United Kingdom");
insert into city values ("Alicante",334757,"Spain");
insert into city values ("Bielefeld",331906,"Germany");
insert into city values ("Bonn",330579,"Germany");
insert into city values ("Brent",329100,"United Kingdom");
insert into city values ("Cordoba",328428,"Spain");
insert into city values ("Sochi",327608,"Russia");
insert into city values ("Birkenhead",325264,"United Kingdom");
insert into city values ("Orel",324200,"Russia");
insert into city values ("Volzhskiy",323293,"Russia");
insert into city values ("Nottingham",321500,"United Kingdom");
insert into city values ("Smolensk",320991,"Russia");
insert into city values ("Murmansk",319263,"Russia");
insert into city values ("Islington",319143,"United Kingdom");
insert into city values ("Reading",318014,"United Kingdom");
insert into city values ("Iasi",318012,"Romania");
insert into city values ("Valladolid",317864,"Spain");
insert into city values ("Vladikavkaz",317370,"Russia");
insert into city values ("Hrodna",317365,"Belarus");
insert into city values ("Katowice",317316,"Poland");
insert into city values ("Cluj-Napoca",316748,"Romania");
insert into city values ("Cherepovets",315738,"Russia");
insert into city values ("Timisoara",315053,"Romania");
insert into city values ("Vologda",314900,"Russia");
insert into city values ("Kingston upon Hull",314018,"United Kingdom");
insert into city values ("Preston",313332,"United Kingdom");
insert into city values ("Ostrava",313088,"Czech Republic");
insert into city values ("Varna",312770,"Bulgaria");
insert into city values ("Vladimir",310024,"Russia");
insert into city values ("Chita",308500,"Russia");
insert into city values ("Mannheim",307960,"Germany");
insert into city values ("Chernihiv",307684,"Ukraine");
insert into city values ("Newport",306844,"United Kingdom");
insert into city values ("Craiova",304142,"Romania");
insert into city values ("Constanta",303399,"Romania");
insert into city values ("Saransk",303394,"Russia");
insert into city values ("Malmoe",301706,"Sweden");
insert into city values ("Brest",300715,"Belarus");
insert into city values ("Surgut",300367,"Russia");
insert into city values ("Swansea",300352,"United Kingdom");
insert into city values ("Bradford",299310,"United Kingdom");
insert into city values ("Vigo",297332,"Spain");
insert into city values ("Southend-on-Sea",295310,"United Kingdom");
insert into city values ("Sumy",294456,"Ukraine");
insert into city values ("Galati",294087,"Romania");
insert into city values ("Bialystok",291855,"Poland");
insert into city values ("Tambov",290933,"Russia");
insert into city values ("Catania",290927,"Italy");
insert into city values ("Utrecht",290529,"Netherlands");
insert into city values ("Kherson",289096,"Ukraine");
insert into city values ("Poltava",288324,"Ukraine");
insert into city values ("Marienthal",287101,"Germany");
insert into city values ("Karlsruhe",283799,"Germany");
insert into city values ("Hamburg-Nord",280000,"Germany");
insert into city values ("Yoshkar-Ola",279100,"Russia");
insert into city values ("Taganrog",279056,"Russia");
insert into city values ("Horlivka",278550,"Ukraine");
insert into city values ("Kostroma",277656,"Russia");
insert into city values ("Gijon",277554,"Spain");
insert into city values ("Bari",277387,"Italy");
insert into city values ("Nantes",277269,"France");
insert into city values ("Cherkasy",276360,"Ukraine");
insert into city values ("Brasov",276088,"Romania");
insert into city values ("Komsomolsk-on-Amur",275908,"Russia");
insert into city values ("Strasbourg",274845,"France");
insert into city values ("Belfast",274770,"United Kingdom");
insert into city values ("Nalchik",272800,"Russia");
insert into city values ("Wiesbaden",272432,"Germany");
insert into city values ("Ljubljana",272220,"Slovenia");
insert into city values ("Khmelnytskyi",271263,"Ukraine");
insert into city values ("Derby",270468,"United Kingdom");
insert into city values ("Muenster",270184,"Germany");
insert into city values ("Gelsenkirchen",270028,"Germany");
insert into city values ("Sterlitamak",267231,"Russia");
insert into city values ("Chernivtsi",266533,"Ukraine");
insert into city values ("Eixample",266477,"Spain");
insert into city values ("Aachen",265208,"Germany");
insert into city values ("Petrozavodsk",265025,"Russia");
insert into city values ("Zhytomyr",263507,"Ukraine");
insert into city values ("Moenchengladbach",261742,"Germany");
insert into city values ("Plymouth",260203,"United Kingdom");
insert into city values ("Augsburg",259196,"Germany");
insert into city values ("Luton",258018,"United Kingdom");
insert into city values ("L'Hospitalet de Llobregat",257038,"Spain");
insert into city values ("Espoo",256760,"Finland");
insert into city values ("Latina",256644,"Spain");
insert into city values ("Bratsk",256600,"Russia");
insert into city values ("Rivne",255106,"Ukraine");
insert into city values ("Carabanchel",253678,"Spain");
insert into city values ("Wolverhampton",252791,"United Kingdom");
insert into city values ("Eimsbuettel",251907,"Germany");
insert into city values ("Altona",250192,"Germany");
insert into city values ("Nis",250000,"Serbia");
insert into city values ("Porto",249633,"Portugal");
insert into city values ("Montpellier",248252,"France");
insert into city values ("Czestochowa",248125,"Poland");
insert into city values ("City of Westminster",247614,"United Kingdom");
insert into city values ("Chemnitz",247220,"Germany");
insert into city values ("Orsk",246836,"Russia");
insert into city values ("Southampton",246201,"United Kingdom");
insert into city values ("A Coruna",246056,"Spain");
insert into city values ("Gdynia",244969,"Poland");
insert into city values ("Nizhnevartovsk",244937,"Russia");
insert into city values ("Braunschweig",244715,"Germany");
insert into city values ("Puente de Vallecas",244151,"Spain");
insert into city values ("Angarsk",243158,"Russia");
insert into city values ("Mar'ino",243000,"Russia");
insert into city values ("Novorossiysk",241856,"Russia");
insert into city values ("Khimki",239967,"Russia");
insert into city values ("Blackpool",239409,"United Kingdom");
insert into city values ("Krefeld",237984,"Germany");
insert into city values ("Halle (Saale)",237865,"Germany");
insert into city values ("Arhus",237551,"Denmark");
insert into city values ("Podgorica",236852,"Montenegro");
insert into city values ("Ivano-Frankivsk",236602,"Ukraine");
insert into city values ("Kosice",236563,"Slovakia");
insert into city values ("Sant Marti",235719,"Spain");
insert into city values ("Gasteiz / Vitoria",235661,"Spain");
insert into city values ("Yakutsk",235600,"Russia");
insert into city values ("Granada",234325,"Spain");
insert into city values ("Nizhnekamsk",234297,"Russia");
insert into city values ("Kamyanske",233358,"Ukraine");
insert into city values ("Hamburg-Mitte",233144,"Germany");
insert into city values ("Dzerzhinsk",233126,"Russia");
insert into city values ("Kiel",232758,"Germany");
insert into city values ("Bordeaux",231844,"France");
insert into city values ("Gent",231493,"Belgium");
insert into city values ("Syktyvkar",230139,"Russia");
insert into city values ("Elche",230112,"Spain");
insert into city values ("Milton Keynes",229941,"United Kingdom");
insert into city values ("Magdeburg",229826,"Germany");
insert into city values ("Ploiesti",228851,"Romania");
insert into city values ("Lille",228328,"France");
insert into city values ("Ciudad Lineal",228171,"Spain");
insert into city values ("Bexley",228000,"United Kingdom");
insert into city values ("Kropyvnytskyy",227413,"Ukraine");
insert into city values ("Sosnowiec",227295,"Poland");
insert into city values ("Staryy Oskol",226977,"Russia");
insert into city values ("Neue Neustadt",226851,"Germany");
insert into city values ("Radom",226794,"Poland");
insert into city values ("Groznyy",226100,"Russia");
insert into city values ("Oviedo",224005,"Spain");
insert into city values ("Santa Cruz de Tenerife",222417,"Spain");
insert into city values ("Graz",222326,"Austria");
insert into city values ("Ternopil",221820,"Ukraine");
insert into city values ("Shakhty",221312,"Russia");
insert into city values ("Blagoveshchensk",221296,"Russia");
insert into city values ("Banja Luka",221106,"Bosnia");
insert into city values ("Babruysk",220517,"Belarus");
insert into city values ("Fuencarral-El Pardo",220085,"Spain");
insert into city values ("Kremenchuk",220065,"Ukraine");
insert into city values ("Messina",219948,"Italy");
insert into city values ("Badalona",219547,"Spain");
insert into city values ("Oberhausen",219176,"Germany");
insert into city values ("Verona",219103,"Italy");
insert into city values ("Prokop'yevsk",219000,"Russia");
insert into city values ("Terrassa",218535,"Spain");
insert into city values ("Mokotow",217683,"Poland");
insert into city values ("Rybinsk",216724,"Russia");
insert into city values ("Vykhino-Zhulebino",216000,"Russia");
insert into city values ("Freiburg",215966,"Germany");
insert into city values ("Northampton",215963,"United Kingdom");
insert into city values ("Zelenograd",215727,"Russia");
insert into city values ("Archway",215667,"United Kingdom");
insert into city values ("Biysk",215430,"Russia");
insert into city values ("Novi Sad",215400,"Serbia");
insert into city values ("Velikiy Novgorod",215062,"Russia");
insert into city values ("Centralniy",214625,"Russia");
insert into city values ("Lutsk",213661,"Ukraine");
insert into city values ("Bergen",213585,"Norway");
insert into city values ("Braila",213569,"Romania");
insert into city values ("Norwich",213166,"United Kingdom");
insert into city values ("Luebeck",212207,"Germany");
insert into city values ("Cartagena",211996,"Spain");
insert into city values ("Eindhoven",209620,"Netherlands");
insert into city values ("Rennes",209375,"France");
insert into city values ("Kielce",208598,"Poland");
insert into city values ("Jerez de la Frontera",207532,"Spain");
insert into city values ("Oradea",206614,"Romania");
insert into city values ("Sabadell",206493,"Spain");
insert into city values ("Mostoles",206478,"Spain");
insert into city values ("Linz",204846,"Austria");
insert into city values ("Alcala de Henares",204574,"Spain");
insert into city values ("Debrecen",204124,"Hungary");
insert into city values ("Padova",203725,"Italy");
insert into city values ("Erfurt",203254,"Germany");
insert into city values ("Vasyl'evsky Ostrov",203058,"Russia");
insert into city values ("Tampere",202687,"Finland");
insert into city values ("Harburg",202571,"Germany");
insert into city values ("Pskov",201990,"Russia");
insert into city values ("Favoriten",201882,"Austria");
insert into city values ("Nicosia",200452,"Cyprus");
insert into city values ("Charleroi",200132,"Belgium");
insert into city values ("Severnyy",200000,"Russia");
insert into city values ("Tilburg",199613,"Netherlands");
insert into city values ("Balakovo",199572,"Russia");
insert into city values ("Armavir",199548,"Russia");
insert into city values ("Bila Tserkva",199163,"Ukraine");
insert into city values ("Dudley",199059,"United Kingdom");
insert into city values ("Hagen",198972,"Germany");
insert into city values ("Gliwice",198835,"Poland");
insert into city values ("Torun",198613,"Poland");
insert into city values ("Pamplona",198491,"Spain");
insert into city values ("Rostock",198293,"Germany");
insert into city values ("Fuenlabrada",197836,"Spain");
insert into city values ("Aberdeen",196670,"United Kingdom");
insert into city values ("Reims",196565,"France");
insert into city values ("Engels",196011,"Russia");
insert into city values ("Burgas",195966,"Bulgaria");
insert into city values ("Kassel",194501,"Germany");
insert into city values ("Severodvinsk",194292,"Russia");
insert into city values ("Portsmouth",194150,"United Kingdom");
insert into city values ("Newcastle upon Tyne",192382,"United Kingdom");
insert into city values ("Klaipeda",192307,"Lithuania");
insert into city values ("Zabrze",192177,"Poland");
insert into city values ("Zlatoust",191366,"Russia");
insert into city values ("Cork",190384,"Ireland");
insert into city values ("Vantaa",190058,"Finland");
insert into city values ("Syzran'",189338,"Russia");
insert into city values ("Bytom",189186,"Poland");
insert into city values ("Almeria",188810,"Spain");
insert into city values ("Sutton",187600,"United Kingdom");
insert into city values ("Petropavlovsk-Kamchatsky",187282,"Russia");
insert into city values ("Trieste",187056,"Italy");
insert into city values ("Donaustadt",187007,"Austria");
insert into city values ("Leganes",186066,"Spain");
insert into city values ("Le Havre",185972,"France");
insert into city values ("Swindon",185609,"United Kingdom");
insert into city values ("San Sebastian",185357,"Spain");
insert into city values ("Mainz",184997,"Germany");
insert into city values ("Brescia",184826,"Italy");
insert into city values ("Geneva",183981,"Switzerland");
insert into city values ("Cergy-Pontoise",183430,"France");
insert into city values ("Sants-Montjuic",183120,"Spain");
insert into city values ("Santander",182700,"Spain");
insert into city values ("Liege",182597,"Belgium");
insert into city values ("Kamensk-Ural'skiy",182500,"Russia");
insert into city values ("Prato",181820,"Italy");
insert into city values ("Saarbruecken",181227,"Germany");
insert into city values ("Groningen",181194,"Netherlands");
insert into city values ("Taranto",181082,"Italy");
insert into city values ("Crawley",180508,"United Kingdom");
insert into city values ("Castello de la Plana",180005,"Spain");
insert into city values ("Yasenevo",180000,"Russia");
insert into city values ("Praga Poludnie",179836,"Poland");
insert into city values ("Podolsk",179400,"Russia");
insert into city values ("Hamm",178967,"Germany");
insert into city values ("Burgos",178966,"Spain");
insert into city values ("Amadora",178858,"Portugal");
insert into city values ("Ipswich",178835,"United Kingdom");
insert into city values ("Bielsko-Biala",176515,"Poland");
insert into city values ("Yuzhno-Sakhalinsk",176484,"Russia");
insert into city values ("Almere Stad",176432,"Netherlands");
insert into city values ("Split",176314,"Croatia");
insert into city values ("Saint-Etienne",176280,"France");
insert into city values ("Turku",175945,"Finland");
insert into city values ("Wigan",175405,"United Kingdom");
insert into city values ("Croydon",173314,"United Kingdom");
insert into city values ("Miskolc",172637,"Hungary");
insert into city values ("Walsall",172141,"United Kingdom");
insert into city values ("Herne",172108,"Germany");
insert into city values ("Lyublino",172000,"Russia");
insert into city values ("Mansfield",171958,"United Kingdom");
insert into city values ("Olsztyn",171803,"Poland");
insert into city values ("Prizren",171464,"Serbia");
insert into city values ("Bacau",171396,"Romania");
insert into city values ("Oxford",171380,"United Kingdom");
insert into city values ("Muelheim",170921,"Germany");
insert into city values ("Albacete",169716,"Spain");
insert into city values ("Reggio Calabria",169140,"Italy");
insert into city values ("Arad",169065,"Romania");
insert into city values ("Baranovichi",168772,"Belarus");
insert into city values ("Toulon",168701,"France");
insert into city values ("Angers",168279,"France");
insert into city values ("Horta-Guinardo",168092,"Spain");
insert into city values ("Patra",168034,"Greece");
insert into city values ("Alcorcon",167967,"Spain");
insert into city values ("Berezniki",167748,"Russia");
insert into city values ("Volgodonsk",167731,"Russia");
insert into city values ("Breda",167673,"Netherlands");
insert into city values ("Pitesti",167669,"Romania");
insert into city values ("Miass",167500,"Russia");
insert into city values ("Abakan",167289,"Russia");
insert into city values ("Neukoelln",167248,"Germany");
insert into city values ("Getafe",167164,"Spain");
insert into city values ("Novocherkassk",166974,"Russia");
insert into city values ("Osnabrueck",166462,"Germany");
insert into city values ("Nou Barris",166310,"Spain");
insert into city values ("Warrington",165456,"United Kingdom");
insert into city values ("Szeged",164883,"Hungary");
insert into city values ("Basel",164488,"Switzerland");
insert into city values ("Zenica",164423,"Bosnia");
insert into city values ("Solingen",164359,"Germany");
insert into city values ("Pilsen",164180,"Czech Republic");
insert into city values ("Nazran'",164131,"Russia");
insert into city values ("Slough",163777,"United Kingdom");
insert into city values ("Piraeus",163688,"Greece");
insert into city values ("Bournemouth",163600,"United Kingdom");
insert into city values ("Peterborough",163379,"United Kingdom");
insert into city values ("Ludwigshafen am Rhein",163196,"Germany");
insert into city values ("Floridsdorf",162779,"Austria");
insert into city values ("Leverkusen",162738,"Germany");
insert into city values ("Hortaleza",161661,"Spain");
insert into city values ("Rubtsovsk",161065,"Russia");
insert into city values ("Anderlecht",160553,"Belgium");
insert into city values ("Mytishchi",160542,"Russia");
insert into city values ("Salavat",159893,"Russia");
insert into city values ("Oldenburg",159218,"Germany");
insert into city values ("Khoroshevo-Mnevniki",159000,"Russia");
insert into city values ("Bibirevo",159000,"Russia");
insert into city values ("Modena",158886,"Italy");
insert into city values ("Nijmegen",158732,"Netherlands");
insert into city values ("Grenoble",158552,"France");
insert into city values ("Cambridge",158434,"United Kingdom");
insert into city values ("Rzeszow",158382,"Poland");
insert into city values ("Doncaster",158141,"United Kingdom");
insert into city values ("Gol'yanovo",158000,"Russia");
insert into city values ("Admiralteisky",157897,"Russia");
insert into city values ("San Blas-Canillejas",157367,"Spain");
insert into city values ("Ussuriysk",157068,"Russia");
insert into city values ("Tiraspol",157000,"Moldova");
insert into city values ("Pecs",156649,"Hungary");
insert into city values ("Istanbul",15000000,"Turkey");
insert into city values ("Bergamo",120000,"Italy");
insert into city values ("Heraklion",173993,"Greece");
insert into city values ("Ibiza",49727,"Spain");
insert into city values ("Cologne",1086000,"Germany");
insert into city values ("Mulhouse",110370,"France");
insert into city values ("Seville",688711,"Spain");
insert into city values ("Venice",261905,"Italy");
insert into city values ("Rhodes",115490,"Greece");
insert into city values ("Faro",60995,"Portugal");
insert into city values ("Uman",82603,"Ukraine"); 


-----------------------------------------------------------------------------



--headOfGovernment iNSERT STATMMENTS  -------------------------------------------------------
insert into headOfGovernment values ("Olaf","Scholz","Male","Chancellor","Germany");
insert into headOfGovernment values ("Alexander","De Croo","Male","Prime Minister","Belgium");
insert into headOfGovernment values ("Francisco","Pascual Obama Asue","Male","Prime Minister","France");
insert into headOfGovernment values ("Pierre","Dartout","Male","Minister of State","Monaco");
insert into headOfGovernment values ("Mark","Rutte","Male","Prime Minister","Netherlands");
insert into headOfGovernment values ("Karl","Nehammer","Male","Chancellor","Austria");
insert into headOfGovernment values ("Ignazio","Cassis","Male","President ","Switzerland");
insert into headOfGovernment values ("Xavier ","Bettel","Male","Prime Minister","Luxembourg");
insert into headOfGovernment values ("Daniel","Risch","Male","Prime Minister","Liechtenstein");
insert into headOfGovernment values ("Mikhail ","Mishustin ","Male","Prime Minister","Russia");
insert into headOfGovernment values ("Viktor","Orban","Male","Prime Minister","Hungary");
insert into headOfGovernment values ("Denys","Shmyhal","Male","Prime Minister","Ukraine");
insert into headOfGovernment values ("Galab","Donev","Male","Prime Minister","Bulgaria");
insert into headOfGovernment values ("Mateusz","Morawiecki","Male","Prime Minister","Poland");
insert into headOfGovernment values ("Alexander","Lukashenko","Male","President ","Belarus");
insert into headOfGovernment values ("Petr","Fiala","Male","Prime Minister","Czech Republic");
insert into headOfGovernment values ("Nicolae","Ciuca","Male","Prime Minister","Romania");
insert into headOfGovernment values ("Natalia","Gavrilita","Female","Prime Minister","Moldova");
insert into headOfGovernment values ("Eduard","Heger","Male","Prime Minister","Slovakia");
insert into headOfGovernment values ("Fernando","Vergez Alzaga","Male","President of the Governorate","Vatican City");
insert into headOfGovernment values ("Dritan ","Abazovic","Male","Prime Minister","Montenegro");
insert into headOfGovernment values ("Antonio ","Costa","Male","Prime Minister","Portugal");
insert into headOfGovernment values ("Ana","Brnabic","Female","Prime Minister","Serbia");
insert into headOfGovernment values ("Pedro","Sanchez","Male","Prime Minister","Spain");
insert into headOfGovernment values ("Robert","Golob","Male","Prime Minister","Slovenia");
insert into headOfGovernment values ("Andrej ","Plenkovic","Male","Prime Minister","Croatia");
insert into headOfGovernment values ("Kyriakos","Mitsotakis","Male","Prime Minister","Greece");
insert into headOfGovernment values ("Giorgia","Meloni","Female","Prime Minister","Italy");
insert into headOfGovernment values ("Robert","Abela","Male","Prime Minister","Malta");
insert into headOfGovernment values ("Edi","Rama","Male","Prime Minister","Albania");
insert into headOfGovernment values ("Xavier ","Espot Zamora","Male","Prime Minister","Andorra");
insert into headOfGovernment values ("Zoran ","Tegeltija","Male","Prime Minister","Bosnia");
insert into headOfGovernment values ("Dimitar","Kovacevski","Male","Prime Minister","Macedonia");
insert into headOfGovernment values ("Sanna","Marin","Female","Prime Minister","Finland");
insert into headOfGovernment values ("Ingrida","Simonyte","Female","Prime Minister","Lithuania");
insert into headOfGovernment values ("Ulf","Kristersson","Male","Prime Minister","Sweden");
insert into headOfGovernment values ("Rishi","Sunak","Male","Prime Minister","United Kingdom");
insert into headOfGovernment values ("Mette","Frederiksen","Female","Prime Minister","Denmark");
insert into headOfGovernment values ("Kaja","Kallas","Female","Prime Minister","Estonia");
insert into headOfGovernment values ("Miceal ","Martin","Male","Taoiseach","Ireland");
insert into headOfGovernment values ("Krisjanis","Karins","Male","Prime Minister","Latvia");
insert into headOfGovernment values ("Jonas","Gahr Store","Male","Prime Minister","Norway");
insert into headOfGovernment values ("Katrin ","Jakobsdottir","Female","Prime Minister","Iceland");
insert into headOfGovernment values ("Irakli","Garibashvili","Male","Prime Minister","Georgia");
insert into headOfGovernment values ("Barour","a Steig Nielson","Male","Prime Minister","Faroe Islands");
insert into headOfGovernment values ("Unal","Ustel","Male","Prime Minister","Cyprus");
insert into headOfGovernment values ("Recep","Tayyip Erdogan","Male","President","Turkey");
-----------------------------------------------------------------------------



--biggestAirports INSERT STATMMENTS  -------------------------------------------------------
insert into biggestAirports values (1,"Istanbul Airport","IST","Istanbul","Turkey",37176509);
insert into biggestAirports values (2,"Sheremetyevo International Airport","SVO","Moscow","Russia",30623796);
insert into biggestAirports values (3,"Charles de Gaulle Airport","CDG","Paris","France",26196575);
insert into biggestAirports values (4,"Amsterdam Airport Schiphol","AMS","Amsterdam","Netherlands",25492633);
insert into biggestAirports values (5,"Domodedovo International Airport","DME","Moscow","Russia",25065087);
insert into biggestAirports values (6,"Frankfurt am Main Airport","FRA","Frankfurt","Germany",24812849);
insert into biggestAirports values (7,"Adolfo Suárez Madrid-Barajas Airport","MDA","Madrid","Spain",24135220);
insert into biggestAirports values (8,"Heathrow Airport","LHR","London","United Kingdom",19392178);
insert into biggestAirports values (9,"Josep Tarradellas Barcelona-El Prat Airport","BCN","Barcelona","Spain",18874896);
insert into biggestAirports values (10,"Pulkovo Airport","LED","Saint Petersburg","Russia",18043464);
insert into biggestAirports values (11,"Vnukovo International Airport","VKO","Moscow","Russia",17999084);
insert into biggestAirports values (12,"Orly Airport","ORY","Paris","France",15724580);
insert into biggestAirports values (13,"Palma de Mallorca Airport","PMI","Palma","Spain",14496857);
insert into biggestAirports values (14,"Munich Airport","MUC","Munich","Germany",12496432);
insert into biggestAirports values (15,"Athens International Airport","ATH","Athens","Greece",12345786);
insert into biggestAirports values (16,"Lisbon Airport","LIS","Lisbon","Portugal",12149000);
insert into biggestAirports values (17,"Leonardo da Vinc-Fiumicino Airport","FGO","Rome","Italy",11662842);
insert into biggestAirports values (18,"Vienna International Airport","VIE","Vienna","Austria",10405523);
insert into biggestAirports values (19,"Zurich Airport","ZRH","Zurich","Switzerland",10234428);
insert into biggestAirports values (20,"Berlin Brandenburg Airport","BER","Berlin","Germany",9947006);
insert into biggestAirports values (21,"Milan-Malpensa Airport","MXP","Milan","Italy",9622464);
insert into biggestAirports values (22,"Boryspil International Airport","KBP","Kyiv","Ukraine",9433000);
insert into biggestAirports values (23,"Oslo Airport, Gardermoen","OSL","Oslo","Norway",9398133);
insert into biggestAirports values (24,"Brussels Airport","BRU","Brussels","Belgium",9357221);
insert into biggestAirports values (25,"Copenhagen Airport","CPH","Copenhagen","Denmark",9179654);
insert into biggestAirports values (26,"Malaga Airport","AGP","Malaga","Spain",8874765);
insert into biggestAirports values (27,"Dublin Airport","DUB","Dublin","Ireland",8460000);
insert into biggestAirports values (28,"Dusseldorf Airport","DUS","Duesseldorf","Germany",7944870);
insert into biggestAirports values (29,"Stockholm Arlanda Airport","ARN","Stockholm","Sweden",7494765);
insert into biggestAirports values (30,"Warsaw Chopin Airport","WAW","Warsaw","Poland",7473734);
insert into biggestAirports values (31,"London Stansted Airport","STN","London","United Kingdom",7137113);
insert into biggestAirports values (32,"Henri Coandă International Airport","OTP","Bucharest","Romania",6914610);
insert into biggestAirports values (33,"Simferopol International Airport","SIP","Simferopol","Russia",6830000);
insert into biggestAirports values (34,"Nice Côte d'Azur Airport","NCE","Nice","France",6540424);
insert into biggestAirports values (36,"Gatwick Airport","LGW","London","United Kingdom",6260072);
insert into biggestAirports values (37,"Catania-Fontanarossa Airport","CTA","Catania","Italy",6123791);
insert into biggestAirports values (38,"Manchester Airport","MAN","Manchester","United Kingdom",6098891);
insert into biggestAirports values (39,"Geneva Airport","GVA","Geneva","Switzerland",5923036);
insert into biggestAirports values (40,"Porto Airport","OPO","Porto","Portugal",5842000);
insert into biggestAirports values (41,"Alicante Airport","ALC","Alicante","Spain",5841181);
insert into biggestAirports values (42,"Hamburg Airport","HAM","Hamburg","Germany",5318698);
insert into biggestAirports values (43,"Heraklion International Airport","HER","Heraklion","Greece",5046236);
insert into biggestAirports values (44,"Krasnodar International Airport","KRR","Krasnodar","Russia",5022243);
insert into biggestAirports values (45,"Ibiza Airport","IBZ","Ibiza","Spain",4851819);
insert into biggestAirports values (46,"Luton Airport","LTN","London","United Kingdom",4673656);
insert into biggestAirports values (47,"Marseille Provence Airport","MRS","Marseille","France",4661045);
insert into biggestAirports values (48,"Naples Airport","NAP","Naples","Italy",4636501);
insert into biggestAirports values (49,"Budapest Ferenc Liszt International Airport","BUD","Budapest","Hungary",4622886);
insert into biggestAirports values (50,"Falcone-Borsellino Airport","PMO","Palermo","Italy",4576246);
insert into biggestAirports values (51,"Lyon-Saint-Exupéry Airport","LYS","Lyon","France",4525552);
insert into biggestAirports values (52,"Vaclav Havel Airport Prague","PRG","Prague","Czech Republic",4388826);
insert into biggestAirports values (53,"Milano Linate Airport","LIN","Milan","Italy",4346518);
insert into biggestAirports values (54,"Helsinki Airport","HEL","Helsinki","Finland",4261530);
insert into biggestAirports values (55,"Cologne Bonn Airport","CGN","Cologne","Germany",4253568);
insert into biggestAirports values (56,"Bologna Guglielmo Marconi Airport","BLQ","Bologna","Italy",4103816);
insert into biggestAirports values (57,"Valencia Airport","VLC","Valencia","Spain",4077836);
insert into biggestAirports values (58,"Ufa International Airport","UFA","Ufa","Russia",3987137);
insert into biggestAirports values (59,"Khrabrovo Airport","KGD","Kaliningrad","Russia",3910846);
insert into biggestAirports values (60,"Kazan International Airport","KZN","Kazan","Russia",3876000);
insert into biggestAirports values (61,"Toulouse-Blagnac Airport","TLS","Toulouse","France",3821653);
insert into biggestAirports values (62,"Brussels South Charleroi Airport","CRL","Charleroi","Belgium",3758833);
insert into biggestAirports values (63,"EuroAirport Basel Mulhouse Freiburg","BSL","Mulhouse","France",3621742);
insert into biggestAirports values (64,"Stuttgart Airport","STR","Stuttgart","Germany",3573728);
insert into biggestAirports values (65,"Thessaloniki Airport","SKG","Thessaloniki","Greece",3449658);
insert into biggestAirports values (66,"Seville Airport","SVQ","Seville","Spain",3444459);
insert into biggestAirports values (67,"Venice Marco Polo Airport","VCE","Venice","Italy",3437204);
insert into biggestAirports values (68,"Rhodes International Airport","RHO","Rhodes","Greece",3366614);
insert into biggestAirports values (69,"Sofia Airport","SOF","Sofia","Bulgaria",3364151);
insert into biggestAirports values (70,"Nantes Atlantique Airport","NTE","Nantes","France",3294142);
insert into biggestAirports values (71,"Belgrade Nikola Tesla Airport","BEG","Belgrade","Serbia",3286285);
insert into biggestAirports values (72,"Bergen Airport, Flesland","BGO","Bergen","Norway",3273709);
insert into biggestAirports values (73,"Faro Airport","FAO","Faro","Portugal",3265000);


INSERT INTO Neighbours VALUES ("Portugal", "Spain");
INSERT INTO Neighbours VALUES ("Andorra", "Spain");
INSERT INTO Neighbours VALUES ("France", "Spain");
INSERT INTO Neighbours VALUES ("France", "Andorra");
INSERT INTO Neighbours VALUES ("France", "Belgium");
INSERT INTO Neighbours VALUES ("France", "Luxembourg");
INSERT INTO Neighbours VALUES ("France", "Germany");
INSERT INTO Neighbours VALUES ("France", "Switzerland");
INSERT INTO Neighbours VALUES ("France", "Italy");
INSERT INTO Neighbours VALUES ("France", "United Kingdom");
INSERT INTO Neighbours VALUES ("United Kingdom", "Ireland");
INSERT INTO Neighbours VALUES ("Belgium", "Netherlands");
INSERT INTO Neighbours VALUES ("Belgium", "Germany");
INSERT INTO Neighbours VALUES ("Belgium", "Luxembourg");
INSERT INTO Neighbours VALUES ("Netherlands", "Germany");
INSERT INTO Neighbours VALUES ("Germany", "Denmark");
INSERT INTO Neighbours VALUES ("Germany", "Poland");
INSERT INTO Neighbours VALUES ("Germany", "Czech Republic");
INSERT INTO Neighbours VALUES ("Germany", "Austria");
INSERT INTO Neighbours VALUES ("Germany", "Switzerland");
INSERT INTO Neighbours VALUES ("Italy", "Switzerland");
INSERT INTO Neighbours VALUES ("Italy", "Slovenia");
INSERT INTO Neighbours VALUES ("Italy", "Austria");
INSERT INTO Neighbours VALUES ("Austria", "Switzerland");
INSERT INTO Neighbours VALUES ("Sweden", "Denmark");
INSERT INTO Neighbours VALUES ("Sweden", "Norway");
INSERT INTO Neighbours VALUES ("Sweden", "Finland");
INSERT INTO Neighbours VALUES ("Finland", "Norway");
INSERT INTO Neighbours VALUES ("Russia", "Norway");
INSERT INTO Neighbours VALUES ("Russia", "Finland");
INSERT INTO Neighbours VALUES ("Austria", "Czech Republic");
INSERT INTO Neighbours VALUES ("Austria", "Slovenia");
INSERT INTO Neighbours VALUES ("Austria", "Slovakia");
INSERT INTO Neighbours VALUES ("Austria", "Hungary");
INSERT INTO Neighbours VALUES ("Poland", "Czech Republic");
INSERT INTO Neighbours VALUES ("Slovakia", "Czech Republic");
INSERT INTO Neighbours VALUES ("Slovenia", "Croatia");
INSERT INTO Neighbours VALUES ("Slovenia", "Hungary");
INSERT INTO Neighbours VALUES ("Poland", "Slovakia");
INSERT INTO Neighbours VALUES ("Poland", "Ukraine");
INSERT INTO Neighbours VALUES ("Poland", "Belarus");
INSERT INTO Neighbours VALUES ("Poland", "Russia");
INSERT INTO Neighbours VALUES ("Estonia", "Russia");
INSERT INTO Neighbours VALUES ("Estonia", "Latvia");
INSERT INTO Neighbours VALUES ("Latvia", "Russia");
INSERT INTO Neighbours VALUES ("Latvia", "Lithuania");
INSERT INTO Neighbours VALUES ("Latvia", "Belarus");
INSERT INTO Neighbours VALUES ("Lithuania", "Russia");
INSERT INTO Neighbours VALUES ("Lithuania", "Belarus");
INSERT INTO Neighbours VALUES ("Belarus", "Russia");
INSERT INTO Neighbours VALUES ("Belarus", "Ukraine");
INSERT INTO Neighbours VALUES ("Ukraine", "Russia");
INSERT INTO Neighbours VALUES ("Ukraine", "Moldova");
INSERT INTO Neighbours VALUES ("Ukraine", "Romania");
INSERT INTO Neighbours VALUES ("Ukraine", "Hungary");
INSERT INTO Neighbours VALUES ("Ukraine", "Slovakia");
INSERT INTO Neighbours VALUES ("Slovakia", "Hungary");
INSERT INTO Neighbours VALUES ("Russia", "Georgia");
INSERT INTO Neighbours VALUES ("Turkey", "Georgia");
INSERT INTO Neighbours VALUES ("Turkey", "Bulgaria");
INSERT INTO Neighbours VALUES ("Turkey", "Greece");
INSERT INTO Neighbours VALUES ("Moldova", "Romania");
INSERT INTO Neighbours VALUES ("Hungary", "Romania");
INSERT INTO Neighbours VALUES ("Serbia", "Romania");
INSERT INTO Neighbours VALUES ("Serbia", "Albania");
INSERT INTO Neighbours VALUES ("Bulgaria", "Romania");
INSERT INTO Neighbours VALUES ("Hungary", "Croatia");
INSERT INTO Neighbours VALUES ("Hungary", "Serbia");
INSERT INTO Neighbours VALUES ("Croatia", "Bosnia");
INSERT INTO Neighbours VALUES ("Croatia", "Montenegro");
INSERT INTO Neighbours VALUES ("Croatia", "Serbia");
INSERT INTO Neighbours VALUES ("Macedonia", "Serbia");
INSERT INTO Neighbours VALUES ("Serbia", "Bosnia");
INSERT INTO Neighbours VALUES ("Montenegro", "Bosnia");
INSERT INTO Neighbours VALUES ("Serbia", "Bulgaria");
INSERT INTO Neighbours VALUES ("Serbia", "Montenegro");
INSERT INTO Neighbours VALUES ("Albania", "Montenegro");
INSERT INTO Neighbours VALUES ("Albania", "Macedonia");
INSERT INTO Neighbours VALUES ("Albania", "Greece");
INSERT INTO Neighbours VALUES ("Macedonia", "Greece");
INSERT INTO Neighbours VALUES ("Bulgaria", "Greece");
INSERT INTO Neighbours VALUES ("Macedonia", "Bulgaria");
INSERT INTO Neighbours VALUES ("Italy", "Vatican City");
INSERT INTO Neighbours VALUES ("Liechtenstein", "Austria");
INSERT INTO Neighbours VALUES ("Liechtenstein", "Switzerland");
INSERT INTO Neighbours VALUES ("France", "Monaco");


INSERT INTO Mayor VALUES
("Sergei","Sobyanin","Moscow"),
("Sadiq","Khan","London"),
("Ken","Welch","Saint Petersburg"),
("Michael","Müller","Berlin"),
("Jose Luis","Martinez-Almeida","Madrid"),
("Vitali","Klitschko","Kyiv"),
("Virginia Elena","Raggi","Rome"),
("Anne","Hidalgo","Paris"),
("Gabriela","Firea","Bucharest"),
("Anatoli","Sivak","Minsk"),
("Istvan","Tarlos","Budapest"),
("Peter","Tschentscher","Hamburg"),
("Rafal","Trzasowski","Warsaw"),
("Michael","Ludwig","Vienna"),
("Ada Colau","Ballano","Barcelona"),
("Anna König","Jerlmyr","Stockholm"),
("Ihor","Terekhov","Kharkiv"),
("Anatoly Evgenevich","Lokot","Novosibirsk"),
("Alekséi","Orlov","Yekaterinburg"),
("Yury","Shalabayev","Nizhniy Novgorod"),
("Zoran","Radojicic","Belgrade"),
("Dieter","Reite","Munich"),
("Giuseppe","Sala","Milan"),
("Zdenek","Hřnb","Prague"),
("Frank","Jensen","Copenhagen"),
("Yordanka","Fandukova","Sofia"),
("Elena","Lapushkina","Samara"),
("Sergey","Shelest","Omsk"),
("Ilsur","Metshin","Kazan"),
("Mijaíl","Chernyshov","Rostov-na-Donu"),
("Natalya","Kotova","Chelyabinsk"),
("Ulfat","Mustafin","Ufa"),
("Alexey Valeryevich","Kulemzin","Donetsk"),
("Paul McAuliffe (Lord","Mayor)","Dublin"),
("Philippe","Close","Brussels"),
("Gennady","Trukhanov","Odessa"),
("Roman","Grebennikov","Volgograd"),
("Borys Albertovych","Filatov","Dnipro"),
("Andy","Street","Birmingham"),
("Aleksey","Demkin","Perm"),
("Henriette","Reker","Koeln"),
("Luigi di","Magistris","Naples"),
("Sergey","Yeryomin","Krasnoyarsk"),
("Chiara","Appendino","Turin"),
("Joanne","Anderson","Liverpool"),
("Mikhail","Isayev","Saratov"),
("Vadim","Kstenin","Voronezh"),
("Joan","Ribó","Valencia"),
("Jean-Claude","Gaudin","Marseille"),
("Hanna","Zdanowska","Lodz"),
("Jacek","Majchrowski","Krakow"),
("Olegs","Burovs","Riga"),
("Femke","Halsema","Amsterdam"),
("Anatolii","Kurtiev","Zaporizhzhya"),
("Andriy Ivanovych","Sadovyi","Lviv"),
("Juan","Espadas","Sevilla"),
("Nikolay","Rentz","Tolyatti"),
("Milan","Bandic","Zagreb"),
("Abdulah","Skaka","Sarajevo"),
("Magid","Magid","Sheffield"),
("Jorge","Azcon","Zaragoza"),
("Kostas","Bakoyannis","Athens"),
("Peter","Feldmann","Frankfurt"), 
("Anatoly","Pakhomov","Krasnodar"),
("Leoluca","Orlando","Palermo"),
("Sergei","Yermakov","Ulyanovsk"),
("Adrian","Talmaci","Chisinau"),
("Jacek","Zbigniew","Wroclaw"),
("Oleg","Bekmemetyev","Izhevsk"),
("Yuri","Vilkul","Kryvyy Rih"),
("Marvin","Rees","Bristol"),
("Vladimir","Volkov","Yaroslavl"),
("Sergei","Dugin","Barnaul"),
("Ahmed","Aboutaleb","Rotterdam"),
("Thomas","Kufen","Essen"),
("Jacqueline","McLaren","Glasgow"),
("Fritz","Kuhn","Stuttgart"),
("Ullrich","Sierau","Dortmund"),
("Oleg","Gumenyuk","Vladivostok"),
("Ruslan","Bolotov","Irkutsk"),
("Marco","Bucci","Genoa"),
("Marianne","Borgen","Oslo"),
("Sergei","Kravchuk","Khabarovsk"),
("Sergei","Kravchuk","Khabarovsk Vtoroy"),
("Stephan","Keller","Duesseldorf"),
("Mayor Axel","Josefson","Goeteborg"),
("Jacek","Jaskowiak","Poznan"),
("Francisco de la","Torre","Malaga"),
("Jan","Vapaavuori","Helsinki"),
("Sergey","Salmin","Orenburg"),
("Përparim","Rama","Pristina"),
("Andreas","Bovenschulte","Bremen"),
("Remigijus","Šimašius","Vilnius"),
("Sergey","Kuznetsov","Novokuznetsk"),
("Fíodor","Provotorov","Ryazan'"),
("Sergey","Sobyanin","Tyumen"),
("Fernando","Medina","Lisbon"),
("Yevgenia","Uvarkina","Lipetsk"),
("Marcus","König","Nuernberg"),
("Vacant","Vacant","Hannover"),
("Vladimir","Mutovkin","Penza"),
("Ildar","Jalíkov","Naberezhnyye Chelny"),
("Peter","Soulsby","Leicester"),
("Burkhard","Jung","Leipzig"),
("Alexey","Ogonkov","Kalininskiy"),
("Sören","Link","Duisburg"),
("Sergey","Bozhenov","Astrakhan"),
("Salman","Dadaev","Makhachkala"),
("Dirk","Hilbert","Dresden"),
("Ivan","Klyayn","Tomsk"),
("Oleksandr","Sienkevych","Mykolayiv"),
("Petr","Kirichenko","Homyel'"),
("Ilya","Seredyuk","Kemerovo"),
("Petre","Silegov","Skopje"),
("Pauline Christine","Krikke","The Hague"),
("Gérard","Collomb","Lyon"),
("Yuri","Tskipuri","Tula"),
("Frank","Ross","Edinburgh"),
("Aleksei","Chaly","Sevastopol"),
("Aleksndra","Dulkiewicz","Gdansk"),
("Bart De","Wever","Antwerpen"),
("Kovaleva","Elena","Kirov"),
("Bob","Gettings","Leeds"),
("Pilavov Manolis","Vasyliovych","Luhansk"),
("Cllr","Hinchey","Cardiff"),
("Oleg","Nikolayev","Cheboksary"),
("José Antonio Serrano","Martínez","Murcia"),
("Alexey","Silanov","Kaliningrad"),
("Jean-Luc","Moudenc","Toulouse"),
("Vadym Serhiyovych","Boychenko","Mariupol"),
("Marina","Dbar","Bryansk"),
("Matús","Vallo","Bratislava"),
("Vladimir","Sharypov","Ivanovo"),
("Sergey","Berdnikov","Magnitogorsk"),
("Peter","Tschentscher","Wandsbek"),
("Alexander","Zakurdayev","Kursk"),
("Priotr","Krzystek","Szczecin"),
("José","Hila","Palma"),
("Alexánder","Korzin","Tver"),
("Andy","Burnham","Manchester"),
("Mihhail","Kolvert","Tallinn"),
("Thomas","Eiskirch","Bochum"),
("Robert","Negoiță","Bucharest"),
("Augusto Hidalgo","Marario","Las Palmas de Gran Canaria"),
("Vladislav","Pinaev","Nizhny Tagil"),
("Thomas","Eiskirch","Bochum-Hordel"),
("Oleksandr","Máltsev","Makiivka"),
("Erion","Veliaj","Tirana"),
("Visvaldas","Matijošaitis","Kaunas"),
("Faisal","Hussain's","Stoke-on-Trent"),
("Serhiy","Morhunov","Vinnytsya"),
("Markéta","Vanková","Brno"),
("Vladimir","Tsumarev","Mahilyow"),
("Ciprian","Ciucu","Bucharest"),
("Rafal","Bruski","Bydgoszcz"),
("Virginio","Merola","Bologna"),
("Mikhail","Kuzmin","Stavropol'"),
("Andreas","Mucke","Wuppertal"),
("Alexander","Golkov","Ulan-Ude"),
("Krzysztof","Zuk","Lublin"),
("Cllr","Maton","Coventry"),
("Dmitry","Morev","Arkhangel'sk"),
("Juan Maria","Aburto","Bilbao"),
("Constantinos","Zervas","Thessaloniki"),
("Incumbent Dario","Nardella","Florence"),
("Radu","Mihaiu","Bucharest"),
("Anton","Ivanov","Belgorod"),
("Elena Vyacheslavovna","Sitnikova","Kurgan"),
("Vadim","Zaryankin","Vitebsk"),
("Corine Mauch","SPS/PSS","Zurich"),
("Ivan","Totev","Plovdiv"),
("Vladislav","Shapsha","Kaluga"),
("Christian","Estrosi","Nice"),
("Natalia","Poklonskaya","Krasnogvargeisky"),
("Igor","Lukashev","Simferopol"),
("Alison","Smith","Sunderland"),
("Luis","Barcala","Alicante"),
("Peter","Clausen","Bielefeld"),
("Ashok Alexander","Sridharan","Bonn"),
("Lia","Colacicco","Brent"),
("Rosa","Aguilar","Cordoba"),
("Anatoly","Pakhomov","Sochi"),
("Cllr Jeff","Green","Birkenhead"),
("Yuri","Parakhin","Orel"),
("Igor","Voronin","Volzhskiy"),
("Wendy","Smith","Nottingham"),
("Andrei","Borisov","Smolensk"),
("Igor","Morar","Murmansk"),
("Cllr Troy","Gallagher","Islington"),
("Cllr Rachel","Eden","Reading"),
("Mihai","Chirica","Iasi"),
("Oscar","Puente","Valladolid"),
("Serguéi","Dzantíev","Vladikavkaz"),
("Mechyslau","Hoi","Hrodna"),
("Marcin","Krupa","Katowice"),
("Emil","Boc","Cluj-Napoca"),
("Vadim","Germanov","Cherepovets"),
("Dominic","Fritz","Timisoara"),
("Sergey","Voropanov","Vologda"),
("Councillor Christine","Randall","Kingston upon Hull"),
("Neil","Darby","Preston"),
("Tomás","Macura","Ostrava"),
("Ivan","Portnih","Varna"),
("Andrey","Shokhin","Vladimir"),
("Anatoli","Mijalev","Chita"),
("Peter","Kurz","Mannheim"),
("Vladyslav","Atroshenko","Chernihiv"),
("Jeanne-Marie","Napolitano","Newport"),
("Lia Olguţa","Vasilescu","Craiova"),
("Vergil","Chitac","Constanta"),
("Pyotr","Tultayev","Saransk"),
("Katrin Stjernfeldt","Jammeh","Malmoe"),
("Aleksandr","Rogachuk","Brest"),
("Andrey","Filatov","Surgut"),
("Mike","Day","Swansea"),
("Rob","Keffer","Bradford"),
("Abel","Caballero","Vigo"),
("Cllr Kevin","Robinson","Southend-on-Sea"),
("Oleksandr","Lysenko","Sumy"),
("Ionuț","Pucheanu","Galati"),
("Tadeusz","Truskolaski","Bialystok"),
("Alexander","Nikitin","Tambov"),
("Salvo","Salvatore","Catania"),
("Jan van","Zanen","Utrecht"),
("Ihor","Kolykhaiev","Kherson"),
("Oleksandr","Mamai","Poltava"),
("Daniel","Băluță","Bucharest"),
("Katrin","Eder","Marienthal"),
("Frank","Mentrup","Karlsruhe"),
("Peter","Tschentscher","Hamburg-Nord"),
("Evgeny","Maslov","Yoshkar-Ola"),
("Vladimir","Prasolov","Taganrog"),
("Yevhen","Klep","Horlivka"),
("Sergey","Sitnikov","Kostroma"),
("Ana González","Rodríguez","Gijon"),
("Antonio","Decaro","Bari"),
("Johanna","Rolland","Nantes"),
("Anatoliy","Bondarenko","Cherkasy"),
("Allen","Coliban","Brasov"),
("Alexander Viktorovich","Zhornik","Komsomolsk-on-Amur"),
("Roland","Ries","Strasbourg"),
("Christina","Black","Belfast"),
("Taymuraz","Akhokhov","Nalchik"),
("Gert-Uwe","Mende","Wiesbaden"),
("Zoran","Jankovic","Ljubljana"),
("Mircea","Nicolaidis","Bucharest"),
("Oleksandr","Symсhyshyn","Khmelnytskyi"),
("Robin","Wood","Derby"),
("Davis","Scott","Muenster"),
("Frank","Baranowski","Gelsenkirchen"),
("Rustem","Gazizov","Sterlitamak"),
("Roman","Klichuk","Chernivtsi"),
("Ada","Colau","Eixample"),
("Marcel","Philipp","Aachen"),
("Vladimir","Lyubarsky","Petrozavodsk"),
("Serhiy","Sukhomlyn","Zhytomyr"),
("Felix","Heinrichs","Moenchengladbach"),
("Sue","Dann","Plymouth"),
("Kurt","Gribl","Augsburg"),
("Sameera","Saleem","Luton"),
("Núria","Marín","L'Hospitalet de Llobregat"),
("Jukka","Mäkelä","Espoo"),
("Damiano","Coletta","Latina"),
("Sergéi","Serébrennikov","Bratsk"),
("Oleksandr","Tretiak","Rivne"),
("José Luis","Martínez-Almeida","Carabanchel"),
("Sandra Samuels","OBE","Wolverhampton"),
("Peter","Tschentscher","Eimsbuettel"),
("Mayor Harv","Schroeder","Altona"),
("Dragana","Sotirovski","Nis"),
("Rui de Carvalho de Araújo","Moreira","Porto"),
("Philippe","Saurel","Montpellier"),
("Krzysztof","Matyjaszczyk","Czestochowa"),
("Tri","Ta","City of Westminster"),
("Barbara","Ludwig","Chemnitz"),
("Andrei","Odintsov","Orsk"),
("Mayor Jacqui","Rayment","Southampton"),
("Mayor Inés","Rey","A Coruna"),
("Wojciech","Szczurek","Gdynia"),
("Vasily","Tikhonov","Nizhnevartovsk"),
("Thorsten","Kornblum","Braunschweig"),
("José Luis","Martínez-Almeida","Puente de Vallecas"),
("Sergey","Petrov","Angarsk"),
("Ignazio Roberto Maria","Marino","Mar'ino"),
("Andrey","Kravchenko","Novorossiysk"),
("Dmitry","Voloshin","Khimki"),
("Kathryn","Benson","Blackpool"),
("Frank","Meyer","Krefeld"),
("Bernd","Wiegand","Halle (Saale)"),
("Jacob","Bundsgaard","Arhus"),
("Ivan","Vuković","Podgorica"),
("Mayor Ruslan","Martsynkiv","Ivano-Frankivsk"),
("Jaroslav","Polaček","Kosice"),
("Robert Vilà","Brugués","Sant Marti"),
("Gorka","Urtaran","Gasteiz / Vitoria"),
("Yevgeniy","Grigoriev","Yakutsk"),
("Luis","Salvador","Granada"),
("Ilsur Raisovich","Metshin","Nizhnekamsk"),
("Andriy","Byelousov","Kamyanske"),
("Peter","Tschentscher","Hamburg-Mitte"),
("Ivan","Noskov","Dzerzhinsk"),
("Ulf","Kämpfer","Kiel"),
("Nicolas","Florian","Bordeaux"),
("Mathias De","Clercq","Gent"),
("Natalia","Khozyainova","Syktyvkar"),
("Carlos Gonzalez","Serna","Elche"),
("Amanda","Marlow","Milton Keynes"),
("Lutz","Trumper","Magdeburg"),
("Andrei","Volosevici","Ploiesti"),
("Martine","Aubry","Lille"),
("José Luis","Martínez-Almeida","Ciudad Lineal"),
("Councillor Nick","O'Hare","Bexley"),
("Andriy","Raykovych","Kropyvnytskyy"),
("Arkadiusz","Chęciński","Sosnowiec"),
("Andréi","Chesnokov","Staryy Oskol"),
("Marc","Weigel","Neue Neustadt"),
("Radoslaw","Witkowski","Radom"),
("Khas-Magomed Shakhmometovich","Kadyrov","Groznyy"),
("Clotilde Marie Brigitte","Armand","Bucharest"),
("Alfredo","Canteli","Oviedo"),
("Patricia Hernandez","Gutierrez","Santa Cruz de Tenerife"),
("Siegfried","Nagl","Graz"),
("Serhii","Nadal","Ternopil"),
("Denis","Stanislavov","Shakhty"),
("Oleg","Imameyev","Blagoveshchensk"),
("Draško","Stanivuković","Banja Luka"),
("Andrei","Kovalenko","Babruysk"),
("José Luis","Martínez-Almeida","Fuencarral-El Pardo"),
("Oleh Meydanovych","Babaiev","Kremenchuk"),
("Cateno De","Luca","Messina"),
("Rubén Guijarro","Palma","Badalona"),
("Daniel","Schranz","Oberhausen"),
("Federico","Sboarina","Verona"),
("Maxim","Shkarabeynikov","Prokop'yevsk"),
("Jordi","Ballart","Terrassa"),
("Rafał","Miastowski","Mokotow"),
("Dmitry","Rudakov","Rybinsk"),
("Sergei","Sobyanin","Vykhino-Zhulebino"),
("Martin","Horn","Freiburg"),
("Rufia","Ashraf","Northampton"),
("Anatoly","Smirnov","Zelenograd"),
("Richard","Whittington","Archway"),
("Alexander","Studenikin","Biysk"),
("Milos","Vucevic","Novi Sad"),
("Aleksandr","Rozbaum","Velikiy Novgorod"),
("Alexander","Beglov","Centralniy"),
("Ihor","Polishchuk","Lutsk"),
("Marte Mjøs","Persen","Bergen"),
("Viorel Marian","Dragomir","Braila"),
("Larry","Martin","Norwich"),
("Jan","Lindenau","Luebeck"),
("Ana Belen Castejon","Hernandez","Cartagena"),
("John","Jorritsma","Eindhoven"),
("Nathalie","Appéré","Rennes"),
("Bogdan Brunon","Wenta","Kielce"),
("Dona Maria del Carmen Sanchez","Diaz","Jerez de la Frontera"),
("Florin","Birta","Oradea"),
("Marta","Farres","Sabadell"),
("Noelia Posse","Gómez","Mostoles"),
("Klaus","Luger","Linz"),
("Javier Rodríguez","Palacios","Alcala de Henares"),
("László","Papp","Debrecen"),
("Sergio","Giordani","Padova"),
("Andreas","Bausewein","Erfurt"),
("Alexander","Beglov","Vasyl'evsky Ostrov"),
("Lauri","Lyly","Tampere"),
("Christoph","Schmidt","Harburg"),
("Valery","Alekseyev","Pskov"),
("Marcus","Franz","Favoriten"),
("Constantinos","Yiorkadjis","Nicosia"),
("Paul","Magnette","Charleroi"),
("Olha","Sukhenko","Severnyy"),
("Theo","Weterings","Tilburg"),
("Kiril","Lavrentev","Balakovo"),
("Davit","Khudatyan","Armavir"),
("Hennadii","Dykyi","Bila Tserkva"),
("Sue","Greenaway","Dudley"),
("Erik","Schulz","Hagen"),
("Zygmunt","Frankiewicz","Gliwice"),
("Michał","Zaleski","Torun"),
("Enrique","Maya","Pamplona"),
("Roland","Methling","Rostock"),
("Javier","Ayala","Fuenlabrada"),
("Ryan","White","Aberdeen"),
("Arnaud","Robinet","Reims"),
("Friedrich","Engels","Engels"),
("Dimitar","Nikolov","Burgas"),
("Christian","Geselle","Kassel"),
("Mikhail","Gmyrin","Severodvinsk"),
("Shannon","Glover","Portsmouth"),
("Karen","Robinson","Newcastle upon Tyne"),
("VYTAUTAS","GRUBLIAUSKAS","Klaipeda"),
("Małgorzata","Mańka-Szulik","Zabrze"),
("Maxim","Pekarsky","Zlatoust"),
("John Sheehan (Lord","Mayor)","Cork"),
("Ritva","Viljanen","Vantaa"),
("Victor","Jlistov","Syzran'"),
("Mariusz","Wołosz","Bytom"),
("Ramón","Fernández-Pacheco","Almeria"),
("Michel","Lafrance","Sutton"),
("Konstantin","Bryzgin","Petropavlovsk-Kamchatsky"),
("Roberto","Dipiazza","Trieste"),
("Michael","Ludwig","Donaustadt"),
("Vicente P. Jaen","II","Leganes"),
("Jean Baptiste","Gastinne","Le Havre"),
("Councillor Abdul","Amin","Swindon"),
("Eneko","Goia","San Sebastian"),
("Michael","Ebling","Mainz"),
("Emilio Del","Bono","Brescia"),
("Sandrine","Salerno","Geneva"),
("Jean-Paul","Jeandon","Cergy-Pontoise"),
("Ada","Colau","Sants-Montjuic"),
("Gema Igual","Ortiz","Santander"),
("Willy","Demeyer","Liege"),
("Aleksey","Gerasimov","Kamensk-Ural'skiy"),
("Matteo","Biffoni","Prato"),
("Uwe","Conradt","Saarbruecken"),
("Koen","Schuiling","Groningen"),
("Rinaldo","Melucci","Taranto"),
("Cllr Jilly","Hart","Crawley"),
("Amparo","Marco","Castello de la Plana"),
("Sergey","Sobyanin","Yasenevo"),
("Tomasz","Kucharski","Praga Poludnie"),
("Nikolái","Pestov","Podolsk"),
("Thomas","Hunsteger-Petermann","Hamm"),
("Daniel de la","Rosa","Burgos"),
("Carla","Tavares","Amadora"),
("Councillor John","Cook","Ipswich"),
("Jarosław","Klimaszewski","Bielsko-Biala"),
("Sergey","Nadsadin","Yuzhno-Sakhalinsk"),
("Ank","Bijleveld","Almere Stad"),
("Andro Krstulović","Opara","Split"),
("Gaël","Perdriau","Saint-Etienne"),
("Aleksi","Randell","Turku"),
("Councillor Marie","Morgan","Wigan"),
("Alisa","Flemming","Croydon"),
("Ákos","Kriza","Miskolc"),
("Mike","Bird","Walsall"),
("Frank","Dudda","Herne"),
("Sergey","Sobyanin","Lyublino"),
("Andy","Abrahams","Mansfield"),
("Piotr","Grzymowicz","Olsztyn"),
("Shaqir","Totaj","Prizren"),
("Lucian","Stanciu-Viziteu","Bacau"),
("Delia","Sinclair","Oxford"),
("Marc","Buchholz","Muelheim"),
("Emilio Sáez","Cruz","Albacete"),
("Giuseppe","Falcomata","Reggio Calabria"),
("Călin","Bibarț","Arad"),
("Mikhail","Poluyan","Baranovichi"),
("Hubert","Falco","Toulon"),
("Christophe","Béchu","Angers"),
("Ada","Colau","Horta-Guinardo"),
("Konstantinos","Peletidis","Patra"),
("Natalia de","Andrés","Alcorcon"),
("Sergey","Dyakov","Berezniki"),
("Victor","Melnikov","Volgodonsk"),
("Danny J","Snyder","Breda"),
("Cristian","Gentea","Pitesti"),
("Igor","Voynov","Miass"),
("Alexey","Lemin","Abakan"),
("Martin","Hikel","Neukoelln"),
("Casey Shaun M.","Camacho","Getafe"),
("Anatoly","Volkov","Novocherkassk"),
("Katharina","Pötter","Osnabrueck"),
("Ada","Colau","Nou Barris"),
("Jean","Flaherty","Warrington"),
("László","Botka","Szeged"),
("Elisabeth","Ackermann","Basel"),
("Fuad","Kasumović","Zenica"),
("Tim","Kurzbach","Solingen"),
("Roman","Zarzycký","Pilsen"),
("Nina Konstantinovna","Varlamova","Nazran'"),
("Dilbagh","Parmar","Slough"),
("Giannis","Moralis","Piraeus"),
("Robert","Lawton","Bournemouth"),
("James","Palmer","Peterborough"),
("Eva","Lohse","Ludwigshafen am Rhein"),
("Michael","Ludwig","Floridsdorf"),
("Uwe","Richrath","Leverkusen"),
("Jose Luis","Martinez-Almeida","Hortaleza"),
("Dmitriy Zayvelevich","Feldman","Rubtsovsk"),
("Eric","Thomas","Anderlecht"),
("Yulia","Kupetskaya","Mytishchi"),
("Farid","Gilmanov","Salavat"),
("Jürgen","Krogmann","Oldenburg"),
("Sergey","Sobyanin","Khoroshevo-Mnevniki"),
("Sergey","Sobyanin","Bibirevo"),
("Gian Carlo","Muzzarelli","Modena"),
("Hubert","Bruls","Nijmegen"),
("Eric","Piolle","Grenoble"),
("Sumbul","Siddiqui","Cambridge"),
("Konrad","Fijołek","Rzeszow"),
("Ros","Jones","Doncaster"),
("Sergey","Sobyanin","Gol'yanovo"),
("Alexander","Beglov","Admiralteisky"),
("José Luis","Martínez-Almeida","San Blas-Canillejas"),
("Yevgeny","Korzh","Ussuriysk"),
("Oleg Anatolievich","Dovgopol","Tiraspol"),
("Attila","Péterffy","Pecs"),
("Giorgio","Gori","Bergamo"),
("Henriette","Reker","Cologne"),
("Rogerio","Bacalhau","Faro"),
("Vasilis","Lambrinos","Heraklion"),
("Rafael","Ruiz Gonzalez","Ibiza"),
("Ekrem","Imamoglu","Istanbul"),
("Michele","Lutz","Mulhouse"),
("Hatzis","Hatziefthimiou","Rhodes"),
("Antonio","Munoz","Seville"),
("Luigi","Brugnaro","Venice"),
("Iryna","Pletnyova","Uman");

CREATE TABLE Export(
countryName TEXT REFERENCES Countries(name),
amount REAL,
PRIMARY KEY(countryName)
);

INSERT INTO Export VALUES ("United Kingdom", 860130);
INSERT INTO Export VALUES ("Switzerland", 568560);
INSERT INTO Export VALUES ("Russia", 547740);
INSERT INTO Export VALUES ("Turkey", 242520);
INSERT INTO Export VALUES ("Norway", 200540);
INSERT INTO Export VALUES ("Ukraine", 81530);
INSERT INTO Export VALUES ("Serbia", 34310);
INSERT INTO Export VALUES ("Belarus", 49190);
INSERT INTO Export VALUES ("Bosnia", 10150);
INSERT INTO Export VALUES ("Macedonia", 9150);
INSERT INTO Export VALUES ("Albania", 5590);
INSERT INTO Export VALUES ("Moldova", 4190);
INSERT INTO Export VALUES ("Georgia", 8060);
INSERT INTO Export VALUES ("Andorra", 115);
INSERT INTO Export VALUES ("Montenegro", 2500);
INSERT INTO Export VALUES ("Faroe Islands", 1360);
INSERT INTO Export VALUES ("Poland", 410540);
INSERT INTO Export VALUES ("Austria", 342200);
INSERT INTO Export VALUES ("Belgium", 512000);
INSERT INTO Export VALUES ("Bulgaria", 50600);
INSERT INTO Export VALUES ("Croatia", 34870);
INSERT INTO Export VALUES ("Cyprus", 22450);
INSERT INTO Export VALUES ("Czech Republic", 204920);
INSERT INTO Export VALUES ("Denmark", 236540);
INSERT INTO Export VALUES ("Estonia", 29200);
INSERT INTO Export VALUES ("Finland", 116470);
INSERT INTO Export VALUES ("France", 879700);
INSERT INTO Export VALUES ("Germany", 2000000);
INSERT INTO Export VALUES ("Greece", 87860);
INSERT INTO Export VALUES ("Hungary", 148250);
INSERT INTO Export VALUES ("Iceland", 9710);
INSERT INTO Export VALUES ("Ireland", 672270);
INSERT INTO Export VALUES ("Italy", 687470);
INSERT INTO Export VALUES ("Latvia", 24910);
INSERT INTO Export VALUES ("Liechtenstein", 3700);
INSERT INTO Export VALUES ("Lithuania", 52650);
INSERT INTO Export VALUES ("Luxembourg", 183930);
INSERT INTO Export VALUES ("Malta", 25520);
INSERT INTO Export VALUES ("Monaco", 1899);
INSERT INTO Export VALUES ("Netherlands", 851090);
INSERT INTO Export VALUES ("Portugal", 105020);
INSERT INTO Export VALUES ("Romania", 116050);
INSERT INTO Export VALUES ("Slovakia", 107820);
INSERT INTO Export VALUES ("Slovenia", 51390);
INSERT INTO Export VALUES ("Spain", 497710);
INSERT INTO Export VALUES ("Sweden", 290230);
INSERT INTO Export VALUES ("Vatican City", 0);



