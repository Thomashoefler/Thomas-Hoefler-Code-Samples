Create Table AccessibleLibrary.AcsLib.Facility
(
FacilityId       int     not null PRIMARY KEY,
FacilityAddress  varchar(250) ,
FacilityCity varchar(250),
FacilityState varchar(50),
FacilityZipCode varchar(50));

Create Table AccessibleLibrary.AcsLib.Buses
(BusId int  not null PRIMARY KEY,
FacilityId int  not null,
inservice varchar(3),
make varchar(50),
model varchar(50),
year varchar(4),

  CONSTRAINT FK_Facility_Buses FOREIGN KEY (FacilityId)     
    REFERENCES AccessibleLibrary.AcsLib.Facility (FacilityId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION);

Create Table AccessibleLibrary.AcsLib.Books
(BookId int not null PRIMARY KEY,
BusId int  not null,
Author varchar(200),
PublishDate date,
Genre varchar (100),

  CONSTRAINT FK_Buses_Books FOREIGN KEY (BusId)     
    REFERENCES AccessibleLibrary.AcsLib.Buses (BusId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION);

Create Table AccessibleLibrary.AcsLib.Employee
(EmployeeId  int  not null PRIMARY KEY,
FacilityId int not null,
EmployeeFirstName varchar(100),
EmployeeMiddleName varchar(100),
EmployeeLastName varchar(100),

  CONSTRAINT FK_Facility_Employee FOREIGN KEY (FacilityId)     
    REFERENCES AccessibleLibrary.AcsLib.Facility (FacilityId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION );


Create Table AccessibleLibrary.AcsLib.RouteAssignment
(RouteId int not null PRIMARY KEY,
BusId int  not null,
EmployeeId int ,
Routedate date,
CONSTRAINT FK_Employee_RouteAssignment FOREIGN KEY (EmployeeId)     
    REFERENCES AccessibleLibrary.AcsLib.Employee (EmployeeId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION ,
      CONSTRAINT FK_Buses_RouteAssignment FOREIGN KEY (BusId)     
    REFERENCES AccessibleLibrary.AcsLib.Buses (BusId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION) ;

Create Table AccessibleLibrary.AcsLib.Customers
(CustomerId int not null PRIMARY KEY,
RouteId int not null,
CustomerFirstName varchar(200),
CustomerMiddleName varchar(200),
CustomerLastName varchar(200),
CustomerAge int,
      CONSTRAINT FK_RouteAssignment_Customers FOREIGN KEY (RouteId)     
    REFERENCES AccessibleLibrary.AcsLib.RouteAssignment (RouteId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION );
    
Insert into AccessibleLibrary.AcsLib.Facility
(FacilityId,FacilityAddress,FacilityCity,FacilityState,FacilityZipCode)
Values
(1,'4837 Northport Crossing','Bom Despacho','Arizona','35600-000');
(2,'728 Arapahoe Drive','Huainan','New Mexico','4896'),
(3,'818 Grover Trail','Grimstad','Aust-Agder','4892'),
(4,'5 Homewood Alley','Arue','Colorado','80123'),
(5,'45156 Algoma Court','Manoel Urbano','Florida','69950-000'),
(6,'74 Graceland Point','Ojiya','Texas','959-2612'),
(7,'0929 Fremont Plaza','Rochester','New York','14604'),
(8,'04936 Express Center','Youyang','Washington','09843'),
(9,'458 Mesta Junction','Kaedi','Alabama','43234'),
(10,'830 Holmberg Court','Jurh','California','09345');


Insert into AccessibleLibrary.AcsLib.Buses
(BusId,FacilityId,InService,Make,Model,Year)
Values
(1,1,'Yes','Lincoln','Continental','1998'),
(2,2,'Yes','Nissan','Frontier','2011'         ),
(3,2,'No','Audi','Coupe GT','1987'           ),
(4,2,'Yes','Dodge','Ram 2500','2006'          ),
(5,5,'Yes','Dodge','Neon','1998'              ),
(6,6,'Yes','Ford','Taurus X','2009'           ),
(7,7,'Yes','Subaru','Impreza','1995'          ),
(8,8,'No','Dodge','Ram 3500','1998'           ),
(9,8,'Yes','Nissan','Pathfinder','2008'       ),
(10,10,'Yes','Porsche','944','1988'          );

Insert into AccessibleLibrary.AcsLib.Books
(BookId,BusId,Author,PublishDate,Genre)
Values
(1,1,'Mab Petrollo','2021-08-05','Crime|Mystery'),
(2,2,'Domini Monard','2021-07-10','Drama|Romance|War'),
(11,2,'Domini Monard','2021-07-10','Drama|Romance|War'),
(12,2,'Domini Monard','2021-07-10','Drama|Romance|War'),
(13,2,'Domini Monard','2021-07-10','Drama|Romance|War'),
(14,2,'Domini Monard','2021-07-10','Drama|Romance|War'),
(3,3,'Loren Alldre','2022-02-28','Drama|Mystery|Thriller'),
(4,4,'Estel Arnatt','2021-05-06','Crime|Mystery'),
(5,5,'Waldemar Dowle','2021-08-23','Comedy'),
(6,6,'Gale Hubner','2021-04-21','Drama'),
(7,7,'Nettle Lovstrom','2021-09-16','Comedy|Thriller'),
(8,8,'Leshia Kubec','2022-01-15','Drama|War'),
(9,9,'Alyss Biasioni','2022-01-05','Crime|Drama|Film-Noir'),
(10,10,'Reinaldo Tweed','2022-02-19','Comedy|Musical');


Insert into AccessibleLibrary.AcsLib.Employee
(EmployeeId,FacilityId,EmployeeFirstName,EmployeeMiddleName,EmployeeLastName)
VALUES
(1,1,'Guy',' Tabitha','Serrell'    ),
(2,2,'Martguerita','Kyle','Mulhall'  ),
(3,3,'Odo','Constantine','Cadigan'   ),
(4,4,'Ham','Cheryl','Luton'          ),
(5,5,'Adiana','Greer','Maccari'      ),
(6,7,'Kimbra','Garner','Goodrick'    ),
(7,7,'Caz','Tamqrah','Yedy'         ),
(8,8,'Nicole','Barthel','Whittlesee'),
(9,9,'Kayla','Giraud','Riep'),
(10,2,'Lucina','Tony','Grindell');

Insert into AccessibleLibrary.AcsLib.RouteAssignment
(RouteId,BusId,EmployeeId,RouteDate)
Values
(1,1,1,'2021-04-03'),
(2,2,2,'2022-01-10'),
(11,2,3,'2022-01-11'),
(12,2,4,'2022-01-12'),
(3,3,5,'2021-12-18'),
(4,4,5,'2021-05-07'),
(5,5,6,'2021-06-13'),
(6,6,6,'2021-09-29'),
(7,7,7,'2021-07-06'),
(8,8,8,'2022-01-30'),
(9,9,9,'2022-03-02'),
(10,10,10,'2021-07-02');

Insert into AccessibleLibrary.AcsLib.Customers
(CustomerId,RouteId,CustomerFirstName,CustomerMiddleName,CustomerLastName,CustomerAge)
Values
(1,1,'Elaina','Berny','Catterill',21  ), 
(2,2,'Buckie','Nate','Kinnoch',32     ),
(3,3,'Toiboid','Emylee','Wardingly',43),
(4,4,'Spence','Noll','Floch',24       ),
(5,5,'Reilly','Corry','Fyldes',65     ),
(6,6,'Freeland','Devina','Chable',16  ),
(7,7,'Tristan','Cristina','Norcutt',77),
(8,8,'Sanders','Kiri','Aleksich',28   ),
(9,9,'Rowney','Germain','Matterson',69),
(10,10,'Dunn','Nickie','Dring',30    ),
(11,2,'Buckie','Nate','Kinnoch',32     ),
(12,2,'Buckie','Nate','Kinnoch',32     ),
(13,2,'Buckie','Nate','Kinnoch',32     );

