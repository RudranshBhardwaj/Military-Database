-- Creating Regiment Table
-- Regiment Code-varchar-Primary Key
-- Regiment Name-varchar
-- Headquarter City-varchar
-- Current Strength-int
-- Maximum Strength-int
-- Commander Id-varchar

create table regiment (
regimentcode varchar(20) Primary key,
rname varchar(20) not null,
hqcity varchar(20) not null,
currstrength int not null,
maxstrength int not null,
commanderid varchar(20) not null
);

-- Creating Location Table
-- District-varchar-primary key
-- State-varchar
-- Country-varchar

create table location (
district varchar(20) primary key,
state varchar(20) not null,
country varchar(20) not null
);
-- Creating salary Table
-- Salary Rank-varchar-primary Key
-- Salary-int

create table salary(
sRank varchar(20) Primary key,
salary INT not null
);

-- Creating Operation Table
-- Operation Code-varchar-Primary Key
-- Operation Name-varchar
-- Start Date-date
-- End Date-date
-- OutCome-varchar

create table operation (
operationcode varchar(20) primary key,
oname varchar(20) not null,
startdate date not null,
enddate date not null,
outcome varchar(20) not null
);

-- -- Creating Soldier Table
-- Soldier Id-varchar-Primary Key
-- Soldier Name-varchar
-- Date of Birth-date
-- Date of Joining-date
-- Height-int
-- Weight-int
-- Gender-char
-- District-varchar
-- Regiment Code-varchar
-- Operation code-varchar
-- Soldier Rank-varchar
-- Foreign Key References
-- District From Location
-- Regiment Code from Regiment
-- Operation Code from Operation
-- Soldier Rank from Salary

create table soldier (
soldierid varchar(20) Primary key,
sname varchar(20) not null,
dob date not null,
doj date not null,
height int not null,
weight int not null,
gender char not null,
district varchar(20) not null,
regimentcode varchar(20),
operationcode varchar(20),
srank varchar(20) not null,
foreign key(district) references location(district),
foreign key (regimentcode) references regiment(regimentcode),
foreign key (operationcode) references
operation(operationcode),
foreign key (srank) references salary(srank)
);
--Creating weapon Table

create table weapon (
weaponid varchar(20) Primary key,
wname varchar(20) not null,
wtype varchar(20) not null
);
-- Creating Vehicle Table
create table vehicle (
vehicleid varchar(20) Primary key,
vname varchar(20) not null,
vtype varchar(20) not null,
fueltype varchar(20) not null,
manyear int not null
);
-- Creating Equipment Table
create table equipment (
equipmentid varchar(20) Primary key,
ename varchar(20) not null,
etype varchar(20) not null
);
-- Creating Weapons Inventory Table
create table weaponsinventory (
quantity int not null,
regimentcode varchar(20) not null,
weaponid varchar(20) not null,
foreign key (regimentcode) references regiment
(regimentcode),
foreign key (weaponid) references weapon(weaponid)
);

-- Creating Vehicles Inventory Table
create table vehiclesinventory (
quantity int not null,
regimentcode varchar(20) not null,
vehicleid varchar(20) not null,
foreign key (regimentcode) references regiment
(regimentcode),
foreign key (vehicleid) references vehicle(vehicleid)
);

-- Creating Equipments Inventory Table
create table equipmentsinventory (
quantity int not null,
regimentcode varchar(20) not null,
equipmentid varchar(20) not null,
foreign key (regimentcode) references regiment
(regimentcode),
foreign key (equipmentid) references equipment(equipmentid)
);

-- Creating Medals Table
create table medals (
medalid varchar(20) primary key,
medalname varchar(20) not null,
prize INT not null
);

-- Creating Honors Table
create table honors (
medalid varchar(20) not null,
soldierid varchar(20) not null,
foreign key (medalid) references medals(medalid),
foreign key (soldierid) references soldier (soldierid)
);

-- Creating Posting Table
create table posting (
pfrom date not null,
ptill date not null,
soldierid varchar(20) not null,
district varchar(20) not null,
foreign key(soldierid) references soldier(soldierid),
foreign key(district) references location(district)
);

-- Creating Family Table
create table family (
fathername varchar(20) not null,
soldierid varchar(20) not null,
children int not null,
maritalstatus char not null,
foreign key (soldierid) references soldier (soldierid),
primary key(soldierid, fathername)
);

-- Inserting Data in Regiment Table
INSERT INTO
regiment
VALUES
(
"R01", "Kumaon Regiment", "Ranikhet",57,85, "S12"
),
( "R02", "Rajput Regiment", "Fatehgarh",61,100, "S05"
),
( "R03", "Sikh Regiment", "Ramgarh", 75, 120, "S10"
),
( "R04", "Jat Regiment", "Bareilly", 51, 95, "S18"
);

-- Inserting Data in Operation Table
INSERT INTO
operation
VALUES
( "O01", "Operation Sahyog", '2018-09-24', '2018-11- 17',
"Successful"
),
( "O02", "Operation Calm Down", '2016-05-11', '2016- 08-02',
"Successful"
),
( "O03", "Operation All Out", '2015-06-13', '2015-07- 22',
"Unsuccessful"
),
( "O04", "Operation Maitri", '2015-02-02', '2015-05- 07',
"Successful"
);

-- Inserting Data in Salary Table
INSERT INTO
salary
VALUES
("Soldier", 25000),
("Major", 58000),
("Captain", 47500),
("Colonel", 65000),
("Brigadier", 73000),
("Lieutenant", 35000);

-- Inserting Data in location Table
INSERT INTO
location
VALUES
("Lucknow", "Uttar Pradesh", "India"),
("Bhopal", "Madhya Pradesh", "India"),
("Meerut", "Uttar Pradesh", "India"),
("Patna", "Bihar", "India"),
("Jalandhar", "Punjab", "India"),
("Almora", "Uttarakhand", "India"),
("Chandigarh", "Punjab", "India"),
("Tehri", "Uttarakhand", "India"),
("Indore", "Madhya Pradesh", "India"),
("Allahabad", "Uttar Pradesh", "India");

-- Inserting Data in soldier Table
INSERT INTO
soldier
VALUES
( "S01", "Arjun Pratap", '1987-12-12', '2009-03-13',
176,
72, 'M', "Bhopal", "R02", "O03", "Colonel"
),
( "S02", "Saurabh Pandit", '1980-02-15', '2008-12-09',
179,
73, 'M', "Meerut", "R02", "O02", "Soldier"
),
( "S03", "Shubham Verma", '1990-02-24', '2011-04-15',
182,
76, 'M', "Bhopal", "R01", "O01", "Soldier"
),
( "S04", "Mayank Kumvat", '1978-06-14', '2011-09-21',
163,
69, 'M', "Almora", "R03", "O01", "Lieutenant"
),
( "S05", "Satveer Thakur", '1980-04-20', '2004-10-19',
162,
65, 'M', "Jalandhar", "R02", "O03", "Major"
),
( "S06", "Hamid Ahmed", '1976-06-10', '2004-02-24',
168,
70, 'M', "Chandigarh", "R01", "O01", "Brigadier"
),
( "S07", "Ajay Singh", '1984-04-12', '2003-07-09',
175,
79, 'M', "Chandigarh", "R04", "O04", "Lieutenant"
),
( "S08", "Avantika Kulkarni", '1990-04-26', '2009-08-18',
164,
62, 'F', "Indore", "R04", "O02", "Soldier"
),
( "S09", "Abhishek Saxena", '1975-05-12', '2012-05-16',
181,
76, 'M', "Tehri", "R01", "O01", "Brigadier"
),
( "S10", "Rajveer Singh", '1969-02-15', '2000-03-25',
173,
70, 'M', "Allahabad", "R03", "O02", "Captain"
),
( "S11", "Karan Jagtap", '1988-02-05', '2011-09-02',
167,
70, 'M', "Allahabad", "R04", "O03", "Captain"
),
( "S12", "Vinay Kumar", '1972-07-07', '2004-04-01',
169,
65, 'M', "Meerut", "R01", "O04", "Colonel"
),
( "S13", "Rajat Talesra", '1976-09-19', '2007-10-24',
172,
76, 'M', "Patna", "R02", "O03", "Colonel"
),
( "S14", "Ankur Ranjan", '1969-10-11', '2001-07-22',
169,
64, 'M', "Almora", "R03", "O01", "Captain"
),
( "S15", "Disha Singh", '1983-09-18', '2008-02-28',
165,
65, 'F', "Lucknow", "R04", "O04", "Brigadier"
),
( "S16", "Niranjan Arya", '1971-12-04', '2010-10-21',
171,
69, 'M', "Lucknow", "R02", "O02", "Lieutenant"
),
( "S17", "Dheeru Sachdev", '1981-01-19', '2015-12-31',
168,
66, 'M', "Tehri", "R03", "O01", "Soldier"
),
( "S18", "Vipul Yadav", '1975-06-05', '2004-01-24',
179,
74, 'M', "Indore", "R04", "O03", "Major"
),
( "S19", "Brijmohan Singh", '1998-11-25', '2014-02-12',
173,
65, 'M', "Lucknow", "R01", "O04", "Soldier"
),
( "S20", "Harminder Kaur", '1971-12-17', '2015-11-25',
165,
62, 'F', "Patna", "R02", "O04", "Colonel"
);

-- Inserting Data in weapon Table
INSERT INTO
weapon
VALUES
("W01", "Glock 17", "Pistol"),
("W02", "SPAS 15", "Shotgun"),
("W03", "Micro UZI", "SMG"),
("W04", "MP5", "SMG"),
("W05", "Steyr AUG", "AR"),
("W06", "AKM", "AR"),
("W07", "Barrett M95", "Sniper Rifle"),
("W08", "M4A1 Carbine", "AR"),
("W09", "Steyr SSG", "Sniper Rifle"),
("W10", "M249", "Machine Gun");

-- Inserting Data in vehicle Table
INSERT INTO
vehicle
VALUES
( "V01", "Force Gurkha", "Ligh Utility", "Petrol", 2001
),
("V02", "AL Stallion", "Carrier", "Diesel", 2008),
( "V03", "Sisu Nasu", "All Terrain", "Diesel", 1999
),("V04", "Isuzu F", "Carrier", "Diesel", 2007),
( "V05", "Arjun MBT", "Battle Tank", "Petrol", 1990
),
("V06", "Ajeya", "Battle Tank", "Diesel", 1996),
( "V07", "Sarath", "Infantry combat", "Diesel", 2011
),
( "V08", "Mazda R1", "Light Utility", "Petrol", 2009
);

-- Inserting Data in equipment Table
INSERT INTO
equipment
VALUES
("E01", "MKU Helmet", "Protective gear"),
("E02", "Kevlar Vest", "Protective gear"),
("E03", "Nigh Vision Goggle", "Utility"),
("E04", "HE Grenade", "Utility"),
("E05", "Health Pack", "Medicine"),
("E06", "First Aid Kit", "Medicine");

-- Inserting Data in weapons inventory Table
INSERT INTO
weaponsinventory
VALUES
(12, "R01", "W01"),
(8, "R01", "W02"),
(6, "R01", "W03"),
(8, "R01", "W04"),
(7, "R01", "W05"),
(5, "R01", "W06"),
(4, "R01", "W07"),
(3, "R01", "W08"),
(8, "R01", "W09"),
(4, "R01", "W10"),
(15, "R02", "W01"),
(10, "R02", "W02"),
(5, "R02", "W03"),
(8, "R02", "W04"),
(6, "R02", "W05"),
(4, "R02", "W06"),
(6, "R02", "W07"),
(8, "R02", "W08"),
(4, "R02", "W09"),
(3, "R02", "W10"),
(20
, "R03"
, "W01"),
(10
, "R03"
, "W02"),
(
9
, "R03"
, "W03"),
(
5
, "R03"
, "W04"),
(
6
, "R03"
, "W05"),
(
7
, "R03"
, "W06"),
(
8
, "R03"
, "W07"),
(10
, "R03"
, "W08"),
(
4
, "R03"
, "W09"),
(
5
, "R03"
, "W10"),
(16
, "R04"
, "W01"),
(
8
, "R04"
, "W02"),
(10
, "R04"
, "W03"),
(
8
, "R04"
, "W04"),
(
6
, "R04"
, "W05"),
(
6
, "R04"
, "W06"),
(
8
, "R04"
, "W07"),
(
4
, "R04"
, "W08"),
(
8
, "R04"
, "W09"),
(
5
, "R04"
, "W10");

-- Inserting Data in vehicles Inventory Table
INSERT INTO
vehiclesinventory
VALUES (5, "R01"
, "V01"),
(
2
, "R01"
, "V03"),
(
8
, "R01"
, "V04"),
(
3
, "R01"
, "V05"),
(
3
, "R02"
, "V01"),
(
6
, "R02"
, "V08"),
(
4
, "R02"
, "V02"),
(
8
, "R02"
, "V06"),
(
2
, "R03"
, "V02"),
(
6
, "R03"
, "V03"),
(
8
, "R03"
, "V04"),
(
4
, "R03"
, "V06"),
(
3
, "R04"
, "V08"),
(
7
, "R04"
, "V04"),
(
6
, "R04"
, "V06"),
(
2
, "R04"
, "V03");

-- Inserting Data in eqipments inventory Table
INSERT INTO
equipmentsinventory
VALUES
(54, "R01", "E01"),
(37, "R01", "E02"),
(46, "R01", "E03"),
(42, "R01", "E04"),
(40, "R01", "E05"),
(42, "R01", "E06"),
(44, "R02", "E01"),
(57, "R02", "E02"),
(56, "R02", "E03"),
(62, "R02", "E04"),
(40, "R02", "E05"),
(72, "R02", "E06"),
(44, "R03", "E01"),
(32, "R03", "E02"),
(39, "R03", "E03"),
(60, "R03", "E04"),
(45, "R03", "E05"),
(35, "R03", "E06"),
(50, "R04", "E01"),
(30, "R04", "E02"),
(25, "R04", "E03"),
(58, "R04", "E04"),
(27, "R04", "E05"),
(38, "R04", "E06");

-- Inserting Data in medals Table
INSERT INTO
medals
VALUES
("M01", "Param Vir Chakra", 75000),
("M02", "Ashok Chakra", 65000),
("M03", "Kirti Chakra", 50000),
("M04", "Sarvottam Seva Medal", 42500),
("M05", "Uttam Seva Medal", 35550),
("M06", "Sena Medal", 15000);

-- Inserting Data in honors Table
INSERT INTO
honors
VALUES
("M03", "S04"),
("M06", "S10"),
("M01", "S01"),
("M02", "S12"),
("M03", "S05"),
("M01", "S10"),
("M03", "S18"),
("M02", "S19"),
("M05", "S10"),
("M04", "S18"),
("M01", "S18"),
("M06", "S01"),
("M02", "S03"),
("M05", "S05"),
("M01", "S07"),
("M04", "S08"),
("M02", "S09"),
("M04", "S20"),
("M06", "S16"),
("M05", "S04"),
("M06", "S03"),
("M02", "S15"),
("M03", "S03");

-- Inserting Data in posting Table
INSERT INTO
posting
VALUES
('2017-10-23', '2020-10-22', "S01", "Lucknow"),
('2015-09-13', '2020-10-24', "S02", "Almora"),
('2016-07-02', '2020-08-10', "S03", "Tehri"),
('2017-11-11', '2020-11-12', "S04", "Meerut"),
('2015-10-07', '2020-11-09', "S05", "Patna"),
('2018-12-18', '2020-12-26', "S06", "Meerut"),
('2016-06-12', '2020-07-15', "S07", "Allahabad"),
('2015-10-13', '2020-11-20', "S08", "Patna"),
('2017-12-20', '2020-09-29', "S08", "Lucknow"),
('2015-11-09', '2020-06-06', "S09", "Lucknow"),
('2018-01-01', '2020-09-07', "S10", "Tehri"),
('2018-10-02', '2020-09-15', "S10", "Jalandhar"),
('2016-02-08', '2020-07-12', "S11", "Chandigarh"),
('2017-05-16', '2020-11-09', "S12", "Bhopal"),
('2015-12-01', '2020-05-19', "S12", "Allahabad"),
('2018-04-28', '2020-10-17', "S13", "Jalandhar"),
('2016-12-12', '2020-06-19', "S14", "Lucknow"),
('2017-07-19', '2020-05-18', "S15", "Bhopal"),
('2018-06-21', '2020-08-08', "S15", "Almora"),
('2016-07-16', '2020-02-12', "S16", "Chandigarh"),
('2017-03-21', '2020-04-12', "S16", "Tehri"),
('2015-05-11', '2020-06-04', "S16", "Lucknow"),
('2018-10-24', '2020-06-15', "S17", "Meerut"),
('2017-08-16', '2020-11-11', "S18", "Almora"),
('2015-04-21', '2020-07-15', "S19", "Allahabad"),
('2016-01-16', '2020-11-13', "S20", "Lucknow");

-- Inserting Data in family Table
INSERT INTO
family
VALUES
("Kuwar Pratap", "S01", 1, 'Y'),
("Ashok Pandit", "S02", 0, 'N'),
("Rajeev Verma", "S03", 0, 'Y'),
("Manas Kumvat", "S04", 0, 'N'),
("Nilesh Thakur", "S05", 0, 'Y'),
("Ajaz Ahmed", "S06", 0, 'N'),
("Shantanu Singh", "S07", 2, 'Y'),
("Mahesh Kulkarni", "S08", 2, 'Y'),
("Prateek Saxena", "S09", 2, 'Y'),
("Aman Singh", "S10", 3, 'Y'),
("Arjun Jagtap", "S11", 1, 'Y'),
("Vijay Kumar", "S12", 0, 'N'),
("Naman Talesra", "S13", 0, 'Y'),
("Aditya Ranjan", "S14", 1, 'Y'),
("Akbar Singh", "S15", 3, 'Y'),
("Dhirendra Arya", "S16", 0, 'N'),
("Harshvardhan Sachdev", "S17", 2, 'Y'),
("Umesh Yadav", "S18", 1, 'Y'),
("Balkishore Singh", "S19", 1, 'Y'),
("Jaspreet Kaur", "S20", 2, 'Y');
