Drop database if exists DBPeliculas_in5am;
Create database DBPeliculas_in5am;

use DBPeliculas_in5am;

Create table Peliculas(
	idPelicula INT NOT NULL AUTO_INCREMENT,
	nombrePelicula VARCHAR(100) NOT NULL,
	descripcionPelicula TEXT NOT NULL,
	horarioPelicula VARCHAR(10) NOT NULL,
	precioPelicula DECIMAL(5,2) NOT NULL ,
    primary key PK_idPelicula (idPelicula)	
);

---------------------------------------------
------------ STORED PROCEDURES -------------	

-- lISTAR ---
Delimiter $$ 
Create procedure sp_ListarPeliculas()
   begin
      Select 
        p.idPelicula,
        p.nombrePelicula,
        p.descripcionPelicula,
        p.horarioPelicula,
        p.precioPelicula
     from Peliculas p;
    End$$
Delimiter ;


-- Agregar --
Delimiter $$
    Create procedure sp_AgregarPelicula(
	   in nombrePelicula varchar(100),
       in descripcionPelicula Text, 
       in horarioPelicula varchar(100), 
       in precioPelicula decimal(5,2))
       begin
        Insert into Peliculas(idPelicula, nombrePelicula, descripcionPelicula, horarioPelicula, precioPelicula) 
           values(idPelicula, nombrePelicula, descripcionPelicula, horarioPelicula, precioPelicula);
    End$$
Delimiter ;

CALL sp_AgregarPelicula('Luna Roja', 'Drama romántico guatemalteco', '14:30', 75.00);
CALL sp_AgregarPelicula('Selva Viva', 'Aventura en la selva maya', '16:00', 120.00);
CALL sp_AgregarPelicula('Ciudad Vieja', 'Historia colonial emocionante', '18:45', 95.50);
CALL sp_AgregarPelicula('Fuego Maya', 'Acción y leyendas ancestrales', '20:15', 150.00);
CALL sp_AgregarPelicula('Café Amargo', 'Drama familiar rural', '13:00', 65.00);
CALL sp_AgregarPelicula('Quetzal', 'Orgullo y cultura nacional', '17:30', 110.00);
CALL sp_AgregarPelicula('Volcán', 'Suspenso natural extremo', '21:00', 180.00);
CALL sp_AgregarPelicula('Ixchel', 'Mitología y misterio', '15:45', 90.00);
CALL sp_AgregarPelicula('Antigua', 'Romance en calles coloniales', '19:00', 130.00);
CALL sp_AgregarPelicula('Jaguar', 'Acción en Petén', '22:30', 200.00);
CALL sp_AgregarPelicula('Milpa', 'Vida campesina realista', '12:15', 55.00);
CALL sp_AgregarPelicula('Cenote', 'Aventura subterránea', '16:50', 140.00);
CALL sp_AgregarPelicula('Nahual', 'Terror ancestral', '23:00', 210.00);
CALL sp_AgregarPelicula('Atitlán', 'Belleza natural y drama', '18:00', 160.00);
CALL sp_AgregarPelicula('Comalapa', 'Arte y tradición', '14:00', 85.00);
CALL sp_AgregarPelicula('Tikal', 'Historia maya épica', '20:00', 220.00);
CALL sp_AgregarPelicula('Barrilete', 'Tradiciones del altiplano', '11:30', 50.00);
CALL sp_AgregarPelicula('Monja Blanca', 'Símbolo nacional emotivo', '17:00', 100.00);
CALL sp_AgregarPelicula('Cuchumatanes', 'Drama en la sierra', '19:45', 175.00);
CALL sp_AgregarPelicula('Xela', 'Vida urbana occidental', '21:30', 155.00);

call sp_ListarPeliculas();

-- Buscar --
Delimiter $$
    Create procedure sp_BuscarPelicula(in idPe int)
       begin 
          Select 
             p.idPelicula,
             p.nombrePelicula,
             p.descripcionPelicula,
             p.horarioPelicula,
             p.precioPelicula
         from Peliculas p
             where p.idPelicula = idPe;
         End$$
Delimiter ;

-- Eliminar --
Delimiter $$
   Create procedure sp_EliminarPelicula(in idPe int)
      Begin 
         Delete from Peliculas p
			where p.idPeliculas = idPe;
   End $$
Delimiter ;

Delimiter $$
  Create procedure sp_EditarPelicula(
     in idPe int, in nomPel varchar(100), 
     in descripPe text,
     in horPeli varchar(100),
     in prePe decimal(5,2))
     begin 
        Update Peliculas p
            set 
                p.nombrePelicula = nomPel,
                p.descripcionPelicula = descripPe,
                p.horarioPelicula = horPeli,
                p.precioPelicula = prePe
		    where p.idPelicula = idPe;
   End$$
Delimiter ;