
	CREATE TABLE pedidos (
		pedido numeric(6) not null,
		fecha datetime not null,
		cliente numeric(6) not null,
		total money not null,
		estado char(3) not null, -- [ACT:activo/ANU:anulado]
		pago char(3) not null, -- [PEN:pendiente/PAG:pago/CC:en cuenta corriente]
		entrega char(3) not null, -- [PEN:pendiente/DES:despachado/ENT:entragado]
 	 CONSTRAINT pk_pedidos PRIMARY KEY NONCLUSTERED (pedido))
	;
	CREATE TABLE pedidos_detalle (
		pedido numeric(6) not null,
		renglon numeric(4) not null,
		produto numeric(6) not null,
		cantidad numeric(6) not null,
		importe money not null,
		estado char(3) not null, -- [ACT:activo/ANU:anulado]
 	 CONSTRAINT pk_pedidos_detalle PRIMARY KEY NONCLUSTERED (pedido,renglon))
	;


BEGIN TRANSACTION;

INSERT INTO pedidos (pedido, fecha, cliente, total, estado, pago, entrega) VALUES
(1, CONVERT(DATETIME, '2024-01-10 10:30:00', 103), 1, 15500.00, 'ACT', 'PAG', 'ENT'),
(2, CONVERT(DATETIME, '2024-01-11 11:15:00', 103), 2, 45000.50, 'ACT', 'CC', 'DES'),
(3, CONVERT(DATETIME, '2024-01-12 09:00:00', 103), 3, 8200.00, 'ACT', 'PEN', 'PEN'),
(4, CONVERT(DATETIME, '2024-01-12 15:45:00', 103), 10, 12300.00, 'ANU', 'PEN', 'PEN'),
(5, CONVERT(DATETIME, '2024-01-11 10:00:00', 103), 5, 25600.00, 'ACT', 'PAG', 'ENT'),
(6, CONVERT(DATETIME, '2024-01-12 12:20:00', 103), 12, 18900.00, 'ACT', 'CC', 'DES'),
(7, CONVERT(DATETIME, '2024-01-10 08:30:00', 103), 7, 5400.00, 'ACT', 'PAG', 'ENT'),
(8, CONVERT(DATETIME, '2024-01-10 14:10:00', 103), 15, 32000.00, 'ACT', 'PEN', 'DES'),
(9, CONVERT(DATETIME, '2024-01-9 17:00:00', 103), 20, 9500.25, 'ACT', 'PAG', 'ENT'),
(10, CONVERT(DATETIME, '2024-01-11 11:00:00', 103), 1, 4200.00, 'ACT', 'PAG', 'ENT'),
(50, CONVERT(DATETIME, '2024-02-12 16:00:00', 103), 45, 12800.00, 'ACT', 'CC', 'PEN');

COMMIT;

BEGIN TRANSACTION;

INSERT INTO pedidos_detalle (pedido, renglon, produto, cantidad, importe, estado) VALUES
-- Detalles Pedido 1
(1, 1, 101, 2, 5000.00, 'ACT'),
(1, 2, 105, 1, 5500.00, 'ACT'),
(1, 3, 202, 5, 5000.00, 'ACT'),
-- Detalles Pedido 2
(2, 1, 305, 1, 45000.50, 'ACT'),
-- Detalles Pedido 3
(3, 1, 110, 2, 4100.00, 'ACT'),
(3, 2, 115, 1, 4100.00, 'ACT'),
-- Detalles Pedido 4 (Anulado)
(4, 1, 501, 1, 12300.00, 'ANU'),
-- Detalles Pedido 5
(5, 1, 202, 10, 20000.00, 'ACT'),
(5, 2, 205, 2, 5600.00, 'ACT'),
-- Detalles Pedido 8
(8, 1, 404, 1, 15000.00, 'ACT'),
(8, 2, 408, 1, 17000.00, 'ACT'),
-- Detalles Pedido 10
(10, 1, 101, 1, 4200.00, 'ACT');

COMMIT;
