create table student
(
id varchar(4),
st_name varchar(30),
age int
);

INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);
insert into student values ('1594','Yusuf Erdem',33);
insert into student values ('1593','Yavuz Tahir Erdem',32);
-- parcali veri
insert into student (id,age) values ('1592',30);

select * from student;
select st_name from student;

select * from student where age>27;

--TCL - Transaction Control Lang.

CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real
);

Begin;
insert into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default,'Canan Gül','Ayşe Şen',90.5);

savepoint x;

insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);

ROLLBACK TO x;

select * from ogrenciler2;
commit;

---delete komutu  --

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;

delete from ogrenciler where id=124;

delete from ogrenciler where isim='Kemal Yasa'

delete from ogrenciler where isim='Ali Can' or id=126;

delete from ogrenciler;


-- DDL - Data Definition Lang.
-- CREATE - ALTER - DROP
-- ALTER TABLE --
-- ALTER TABLE tabloda ADD, TYPE, SET, RENAME veya DROP COLUMNS işlemleri için kullanılır

--personel isimli tablo olusturalim

create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);


select * from personel

-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20), add yas int;

--personel den sirket field i siliniz
alter table personel drop column sirket;

-- Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
alter table personel rename column sehir to ulke;

-- Personel tablosunun adını isciler olarak değiştiriniz
alter table personel rename to isciler;


select * from isciler


--DDL -- DROP komutu

drop table isciler;


-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);



INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');--unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');-- not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key


select *from calisanlar


CREATE TABLE calisanlar2
(
id CHAR(5), 
isim VARCHAR(50), 
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE,
constraint yusuf primary key (id)
);


--FOREIGN KEY --

CREATE TABLE adresler (
adres_id char(5),
sokak varchar(20),	
cadde varchar(30),					 
sehir varchar(20),					 
CONSTRAINT yusuf FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');

select * from adresler





