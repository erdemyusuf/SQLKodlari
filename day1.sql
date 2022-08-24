/*
ddl -data definiation lang.
create -alter-drop
*/
--create -tablo olusturma-
CREATE table ogrenci(
ogr_no int,
ogr_isim VARCHAR(30),
notlar REAL,
yas int, 
adres VARCHAR(50),
kayit_tarih DATE
);

-- VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
create table ogr_notlari
as
select ogr_no, notlar from ogrenci;

select * from ogrenci;
select * from ogr_notlari;



					
					
					

