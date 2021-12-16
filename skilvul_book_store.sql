-- Create Database -- 
CREATE DATABASE skilvulbookstore;
USE skilvulbookstore;

-- Create Table Penerbit -- 
CREATE TABLE penerbit
(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR (50) NULL,
  kota VARCHAR(50) NULL
);

-- Create Table Penulis -- 
CREATE TABLE penulis
(
  id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR (50) NULL,
  kota VARCHAR(50) NULL
);

-- Create Table Buku -- 
CREATE TABLE buku (
	id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ISBN VARCHAR(50) NULL,
	judul VARCHAR(50) NULL,
	idPenulis INT(10),
	idPenerbit INT(10),
	harga INT(10) NULL,
	stock INT(10) NULL,
	CONSTRAINT fk_penerbit FOREIGN KEY (idPenerbit) REFERENCES penerbit(id),
	CONSTRAINT fk_penulis FOREIGN KEY (idPenulis) REFERENCES penulis(id)
);

-- Insert --
INSERT INTO penulis(nama, kota) VALUES('Winter', 'South Korea');
INSERT INTO penulis(nama, kota) VALUES('Selena Gomez', 'USA');
INSERT INTO penulis(nama, kota) VALUES('Zelda', 'Japan');

INSERT INTO penerbit(nama, kota) VALUES('Esis', 'Jakarta');
INSERT INTO penerbit(nama, kota) VALUES('Snowman', 'Surabaya');
INSERT INTO penerbit(nama, kota) VALUES('Erlangga', 'Jakarta');

INSERT INTO buku(ISBN, judul, idPenulis, idPenerbit, harga, stock)
VALUES ('ISBN 978-602-8519-93-9.', 'Shape Of Love', 1, 2, 50000, 50);
INSERT INTO buku(ISBN, judul, idPenulis, idPenerbit, harga, stock)
VALUES ('ISBN 800-222-8519-93-9.', 'Rise KPop', 2, 3, 500000, 10);
INSERT INTO buku(ISBN, judul, idPenulis, idPenerbit, harga, stock)
VALUES ('ISBN 224-223-0604-50-9.', 'Pirates Of Caribean', 2, 1, 350000, 100);


-- Inner join buku dan penerbit --
SELECT * 
FROM buku
INNER JOIN penerbit
ON buku.idPenerbit = penerbit.id;

-- LEFT JOIN buku dan penerbit --
SELECT * 
FROM buku
LEFT JOIN penerbit
ON buku.idPenerbit = penerbit.id;

-- RIGHT JOIN buku dan penerbit --
SELECT * 
FROM buku
RIGHT JOIN penerbit
ON buku.idPenerbit = penerbit.id;

-- Cek max harga pada table book --
SELECT MAX(harga)
FROM buku
WHERE stock < 10;

-- Cek min harga pada table book --
SELECT MIN(harga)
FROM buku;

-- Count buku harga < 100k pada table book --
SELECT COUNT(*) AS BukuDibawah100K 
FROM buku
WHERE harga < 100000;



