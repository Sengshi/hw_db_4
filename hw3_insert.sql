--не менее 8 исполнителей;
insert into authors(name) values 
	('Timo Ti'),
	('Ba Nana'),
	('Tomato'),
	('Buka'),
	('Luka'),
	('Re Ni'),
	('Ferika'),
	('Kubli');

--не менее 5 жанров;
insert into genres(name) values 
	('pop'),
	('rock'),
	('jazz'),
	('trans'),
	('metall');

--не менее 8 альбомов;
insert into albums(title, release) values 
	('gruz', '1998-01-01'),
	('rock trunk', '2021-01-01'),
	('grib', '2022-01-01'),
	('tren', '2011-01-01'),
	('figaro', '2019-01-01'),
	('merch', '2018-01-01'),
	('wetrin', '1987-01-01'),
	('wetrin2', '2020-01-01'),
	('groub', '2017-01-01');

--не менее 15 треков;
insert into tracks(album_id, title, duration) values 
	(1, 'gruz', 70),
	(6, 'gruz33', 70),
	(9, 'rock trunk', 120),
	(1, 'grib', 350),
	(2, 'tren', 200),
	(3, 'figaro my', 410),
	(4, 'my merch', 100),
	(5, 'wet my rin', 250),
	(6, 'grmyuz2', 160),
	(7, 'rock trunk2', 220),
	(8, 'grib2', 250),
	(3, 'tren2', 100),
	(4, 'my figaro2', 310),
	(2, 'mymerch2', 200),
	(8, 'wetrin2', 150),
	(5, 'groub', 450);

--не менее 8 сборников.
insert into compilations(title, release) values 
	('1gruz', '1999-01-01'),
	('2rock trunk', '2022-01-01'),
	('3grib', '2023-01-01'),
	('4tren', '2013-01-01'),
	('5figaro', '2015-01-01'),
	('6merch', '2021-01-01'),
	('7wetrin', '1989-01-01'),
	('8groub', '2019-01-01');

--исполнителей с жанрами
insert into albumsauthors values 
	(1, 8),
	(2, 7),
	(3, 6),
	(4, 5),
	(5, 4),
	(6, 3),
	(7, 2),
	(8, 1),
	(9, 2);

--исполнителей с альбомами
insert into genresauthors values 
	(1, 8),
	(2, 7),
	(3, 6),
	(4, 5),
	(5, 4),
	(1, 3),
	(2, 2),
	(3, 1),
	(4, 8),
	(5, 7);

--треки в сборниках
insert into compilationstracks values
	(1, 1),
	(2, 3),
	(3, 5),
	(4, 7),
	(5, 9),
	(6, 11),
	(7, 13),
	(8, 15);
	