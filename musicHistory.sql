--Query all of the entries in the Genre table
select *
from Genre;
select *
from Artist;
select *
from Album;
select *
from Song;


--Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist
values(null,"The Rolling Stones", 1963)

insert into Artist(ArtistName, YearEstablished)
values("AC/DC", 1973);



--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album
values(null, "Exile on Main St", 1971, 50, "Rolling Stones", 29,2);

--Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song
values(null, "Tumblin Dice", 3, 1971, 29, 26);

select Title
from Album
where artistId= 1
and Title= "Point of Entry";


/*Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.*/
select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId= al.ArtistId
order by a.ArtistName desc;


/*Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.*/
select s.Title, al.Title, a.ArtistName
from Song s, Album al, Artist a
where s.AlbumId= al.AlbumId
and s.ArtistId= a.ArtistId;


--select all song, album, artist and genre
select s.Title as "Song",
	   al.Title as "Album"

from Album al
left join Song s on s.AlbumId = al.AlbumId
where s.Title IS NULL





select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName
from Song s, 
left join Album al
on s.AlbumId = al.AlbumId
left join Artist a
on s.artistId= a.ArtistId;


/*Write a SELECT statement to display how many songs exist for each album. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select al.Title, count(s.AlbumId) as "Number of Tracks"
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.Title;


/*Write a SELECT statement to display how many songs exist for each artist. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence*/
select a.ArtistName, count(s.ArtistId) as "Number of Songs"
from Artist a,Song s
where a.ArtistId= s.ArtistId
group by a.ArtistName


/*Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/ 
select g.Label, count(s.GenreId) as "Number of Songs"
from Genre g,Song s
where g.GenreId= s.GenreId
group by g.Label

/*Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.*/
select al.Title, MAX(al.AlbumLength) as "Album Length"
from Album al


/*Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/
select s.Title, MAX(s.SongLength) as "Song Length"
from  Song s


/*Modify the previous query to also display the title of the album.*/
select al.Title, s.Title, MAX(s.SongLength) as "Song Length"
from  Song s, Album al