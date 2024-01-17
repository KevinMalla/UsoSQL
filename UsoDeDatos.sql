CREATE DATABASE Chistes;

USE Chistes;

CREATE TABLE Usuario(
	UsuarioId int PRIMARY KEY,
	Nombre nvarchar(50),
	Contraseña nvarchar(100)
);

CREATE TABLE Chiste (
	ChisteId int PRIMARY KEY,
	Titulo nvarchar(255),
	Cuerpo nvarchar(max),
	AutorId int,
	FOREIGN KEY (AutorID) REFERENCES Usuario(UsuarioID)
);

CREATE TABLE Tematica(
	TematicaId int PRIMARY KEY,
	NombreTematica VARCHAR(50)
);

CREATE TABLE ChistesTematicas (
    ChisteID INT,
    TematicaID INT,
    PRIMARY KEY (ChisteID, TematicaID),
    FOREIGN KEY (ChisteID) REFERENCES Chiste(ChisteID),
    FOREIGN KEY (TematicaID) REFERENCES Tematica(TematicaID)
);

INSERT INTO Usuario (UsuarioID, Nombre, Contraseña) VALUES
(1, 'Manolito', 'contraseña_manolito'),
(2, 'Pepe', 'contraseña_pepe'),
(3, 'Isabel', 'contraseña_isabel'),
(4, 'Pedro', 'contraseña_pedro');

-- Insertar temáticas en la tabla "Tematicas"
INSERT INTO Tematica  (TematicaID, NombreTematica) VALUES
(1, 'humor negro'),
(2, 'humor amarillo'),
(3, 'chistes verdes');


-- Chistes para el usuario Manolito
INSERT INTO Chiste (ChisteID, Titulo, Cuerpo, AutorID) VALUES
(1, 'Chiste 1 Manolito', 'Cuerpo del chiste 1 Manolito', 1),
(2, 'Chiste 2 Manolito', 'Cuerpo del chiste 2 Manolito', 1),
(3, 'Chiste 3 Manolito', 'Cuerpo del chiste 3 Manolito', 1);

-- Asociación de temáticas para los chistes de Manolito
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES
(1, 1), -- humor negro
(1, 2), -- humor amarillo
(1, 3), -- chistes verdes
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3);

-- Chistes para el usuario Pepe
INSERT INTO Chiste (ChisteID, Titulo, Cuerpo, AutorID) VALUES
(4, 'Chiste 1 Pepe', 'Cuerpo del chiste 1 Pepe', 2),
(5, 'Chiste 2 Pepe', 'Cuerpo del chiste 2 Pepe', 2),
(6, 'Chiste 3 Pepe', 'Cuerpo del chiste 3 Pepe', 2);

-- Asociación de temáticas para los chistes de Pepe
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(6, 3);

-- Chistes para el usuario Isabel
INSERT INTO Chiste (ChisteID, Titulo, Cuerpo, AutorID) VALUES
(7, 'Chiste 1 Isabel', 'Cuerpo del chiste 1 Isabel', 3),
(8, 'Chiste 2 Isabel', 'Cuerpo del chiste 2 Isabel', 3),
(9, 'Chiste 3 Isabel', 'Cuerpo del chiste 3 Isabel', 3);

-- Asociación de temáticas para los chistes de Isabel
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(8, 3),
(9, 1),
(9, 2),
(9, 3);

-- Chistes para el usuario Pedro
INSERT INTO Chiste (ChisteID, Titulo, Cuerpo, AutorID) VALUES
(10, 'Chiste 1 Pedro', 'Cuerpo del chiste 1 Pedro', 4),
(11, 'Chiste 2 Pedro', 'Cuerpo del chiste 2 Pedro', 4),
(12, 'Chiste 3 Pedro', 'Cuerpo del chiste 3 Pedro', 4);

-- Asociación de temáticas para los chistes de Pedro
INSERT INTO ChistesTematicas (ChisteID, TematicaID) VALUES
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3);

SELECT ChisteID, Titulo, Cuerpo
FROM Chiste
WHERE AutorID = (SELECT UsuarioID FROM Usuario WHERE Nombre = 'Manolito');

SELECT C.ChisteID, Titulo, Cuerpo
FROM Chiste C
INNER JOIN ChistesTematicas CT ON C.ChisteId = CT.ChisteID
INNER JOIN Tematica T ON CT.TematicaID = T.TematicaId
WHERE T.NombreTematica = 'humor negro' 

SELECT C.ChisteID, Titulo, Cuerpo
FROM Chiste C
INNER JOIN ChistesTematicas CT ON C.ChisteId = CT.ChisteID
INNER JOIN Tematica T ON CT.TematicaID = T.TematicaId
INNER JOIN Usuario U ON C.AutorId = U.UsuarioId
WHERE T.NombreTematica = 'humor negro' AND C.AutorID = (SELECT UsuarioID FROM Usuario WHERE Nombre = 'Manolito');



--SELECT C.ChisteID, Titulo, Cuerpo
--FROM Chiste C
--INNER JOIN ChistesTematicas ON C.ChisteID = ChistesTematicas.ChisteID
--INNER JOIN Tematica T ON ChistesTematicas.TematicaID = T.TematicaID
--WHERE T.NombreTematica = 'humor negro';



