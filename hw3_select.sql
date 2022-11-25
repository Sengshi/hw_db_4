--название и год выхода альбомов, вышедших в 2018 году;
select title as "Название", release as "Дата выпуска" from albums where extract(year from release) = 2018;
--название и продолжительность самого длительного трека;
select title as "Название", duration as "Продолжительность" from tracks where duration = (select max(duration) from tracks);
--название треков, продолжительность которых не менее 3,5 минуты;
select title as "Название", duration as "Продолжительность" from tracks where duration > (3.5 * 60);
--названия сборников, вышедших в период с 2018 по 2020 год включительно;
select title as "Название" from compilations where extract(year from release) >= 2018 AND extract(year from release) <= 2020;
--исполнители, чье имя состоит из 1 слова;
select name from authors where (LENGTH(name) - LENGTH(replace(name, ' ', ''))) = 0;
--название треков, которые содержат слово "мой"/"my".
-- 1 вариант (результат более правдоподобный):
select title as "Название" from tracks where regexp_like (title,'^my | my');
-- 2 вариант:
--select title as "Название" from tracks where title like '%my%';

--add hw_4
--количество исполнителей в каждом жанре;
SELECT g.name, COUNT(author_id) FROM genresauthors ga
LEFT JOIN genres g ON ga.genre_id = g.id
GROUP BY g.name;

--количество треков, вошедших в альбомы 2019-2020 годов;
SELECT count(t.album_id) from albums a 
LEFT JOIN tracks t ON a.id = t.album_id 
WHERE 2019 <= extract(year from a.release) AND extract(year from a.release) <= 2020

--средняя продолжительность треков по каждому альбому;
SELECT a.title, avg(t.duration) from albums a 
LEFT JOIN tracks t ON a.id = t.album_id 
GROUP BY a.title;

--все исполнители, которые не выпустили альбомы в 2020 году;
select a.name from authors a
left join albumsauthors a2 on a.id = a2.author_id
left join albums a3 on a3.id = a2.album_id 
where NOT extract(year from a3.release) = 2020
GROUP BY a.name;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select c2.title from compilationstracks c 
left join compilations c2 on c.compilation_id = c2.id 
left join tracks t on c.track_id = t.id
left join albumsauthors a on a.album_id = t.album_id 
left join authors a2 on a.author_id = a2.id 
where a2.name = 'Re Ni';

--название альбомов, в которых присутствуют исполнители более 1 жанра;
select a.title from albums a 
left join albumsauthors a2 on a.id = a2.album_id 
left join authors a3 on a3.id = a2.author_id  
left join genresauthors g on a3.id = g.author_id  
left join genres g2 on g.genre_id = g2.id
group by a.title
having count(distinct g2.name) > 1 
order by a.title;

--наименование треков, которые не входят в сборники;
select t.title from tracks t 
left join compilationstracks c on t.id = c.track_id 
where c.track_id is null;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select a3.name, t.duration from tracks t 
left join albums a on t.album_id = a.id
left join albumsauthors a2 on a.id = a2.album_id 
left join authors a3 on a2.author_id = a3.id 
group by a3.name, t.duration
having t.duration = (select min(duration) from tracks t2)
order by a3.name;

--название альбомов, содержащих наименьшее количество треков.
select a.title from albums a
left join tracks t on t.album_id = a.id
where t.album_id in (
	select album_id from tracks group by album_id
	having count(id) = (select count(id) from tracks group by album_id order by count limit 1)
	)
