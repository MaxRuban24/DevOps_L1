-- 4. Create a database on the server through the console

CREATE DATABASE metalcatalogue;

USE metalcatalogue;

create table Bands (
    BandID int NOT NULL AUTO_INCREMENT,
    BandName varchar(255) NOT NULL,
    Country varchar(255),
    constraint PK_Band primary key (BandID,BandName)
);

create table Albums (
    AlbumID int NOT NULL AUTO_INCREMENT,
    AlbumName varchar(255) NOT NULL,
    BandID int NOT NULL,
    BandName varchar(255) NOT NULL,
    Releaseyear year NOT NULL,
    constraint PK_Album primary key (AlbumID,AlbumName),
    constraint FK_BandAlbum foreign key (BandID,BandName) 
        references Bands(BandID, BandName)  
);

create table Songs (
    Songnum smallint, 
    Songname varchar(255) NOT NULL,
    BandID int NOT NULL,
    BandName varchar(255) NOT NULL,
    AlbumID int NOT NULL,
    AlbumName varchar(255) NOT NULL,
    constraint FK_SongBand foreign key (BandID,BandName)
        references Bands(BandID,BandName),
    constraint FK_SongAlbum foreign key (AlbumID,AlbumName)
        references Albums(AlbumID,AlbumName)
);