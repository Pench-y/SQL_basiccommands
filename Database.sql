--- Commands CRUD ---

Use Data_base; ---Use DB

--- Create ---
Create database Data_base; ---Create DB

Create table usuario( ---Create one table in DB
	Id int not null,								---Agregar Columns
	Nombre/*Attribute*/ varchar /*Data type*/ (255) /*Capacity*/ not null,
	Apellido/*Attribute*/ varchar /*Data type*/ (255) /*Capacity*/ not null ,
	Num_celular /*Attribute*/ int /*Data type*/ not null,
	Primary key (Id)
);

create table Product (
	Id int not null,
	Nombre /*Attribute*/varchar (50) not null,/*Attribute not null*/
	Create_by /*Attribute*/ int not null,
	marca /*Attribute*/ varchar/*Data type*/ (50)/*Capacity*/ not null,
	primary key (Id),---PK
	foreign key (Create_by)/*FK*/ references usuario (Id)
);

---Insert ---
Insert into usuario/*Nametable*/ (Id, Nombre, Apellido, Num_celular) ---Declare fields
values (1,'Andres', 'Suares', 350); ---Enter values in a table

--Ingresar varios valores al tiempo
Insert into /*Nametable*/ Product (Id, Nombre, Create_by, marca) --Declare fields(Columns)
values (0,'ipad' ,1, 'apple'),
(1,'iphone' ,1, 'apple'),
(2,'watch' ,1, 'apple');

---Reand ---
select */*To specify columns*/ from usuario/*Nametable*/; ---Show table

SELECT * FROM sysobjects WHERE xtype = 'U' ---Show all project tables

select * from Product; ---Table 2

select */*To specify columns*/ from usuario/*Nametable*/ ---Show table
where Nombre/*columns*/ = 'Andres';---Search for data with a code

select */*To specify columns*/ from usuario/*Nametable*/ ---Show table
where Nombre/*columns*/ = 'Andres' and Apellido = 'Suarez';---Search for data with two coditions

--- Update ---

update usuario/*Nametable*/
set Apellido/*Column of change*/ = 'Suarez'/*New value*/
where Apellido/*coditional column*/ = 'Suares'/*value change*/;

--Rename table
EXEC sp_rename /*Before name*/'usuario', /*New name*/ 'Usuario'; 

--- Delete ---

--drop table /*table*/ usuario; --- delete table
delete from /*table*/usuario where /*column*/ Nombre = 'Andres'; 

-------JOIN-------

--Left Join
select u.Id as 'Identificación', 
u.Apellido, 
u.Nombre
from usuario u
left join Product p
On u.Id = p.Create_by;

--Right Join
select u.Id as 'Identificación', 
u.Apellido, 
u.Nombre
from usuario u
right join Product p
On u.Id = p.Create_by;

--Full Join
select u.Id as 'Identificación', 
u.Apellido, 
u.Nombre
from usuario u
full join Product p
On u.Id = p.Create_by;

--Inner Join
select u.Id as 'Identificación', 
u.Apellido, 
u.Nombre
from usuario u
Join Product p
On u.Id = p.Create_by;