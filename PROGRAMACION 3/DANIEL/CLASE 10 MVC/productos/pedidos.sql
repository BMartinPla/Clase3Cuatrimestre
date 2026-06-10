
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
(1, '2024-01-10 10:30:00', 1, 15500.00, 'ACT', 'PAG', 'ENT'),
(2, '2024-01-11 11:15:00', 2, 45000.50, 'ACT', 'CC', 'DES'),
(3, '2024-01-12 09:00:00', 3, 8200.00, 'ACT', 'PEN', 'PEN'),
(4, '2024-01-12 15:45:00', 10, 12300.00, 'ANU', 'PEN', 'PEN'),
(5, '2024-01-13 10:00:00', 5, 25600.00, 'ACT', 'PAG', 'ENT'),
(6, '2024-01-14 12:20:00', 12, 18900.00, 'ACT', 'CC', 'DES'),
(7, '2024-01-15 08:30:00', 7, 5400.00, 'ACT', 'PAG', 'ENT'),
(8, '2024-01-15 14:10:00', 15, 32000.00, 'ACT', 'PEN', 'DES'),
(9, '2024-01-16 17:00:00', 20, 9500.25, 'ACT', 'PAG', 'ENT'),
(10, '2024-01-17 11:00:00', 1, 4200.00, 'ACT', 'PAG', 'ENT'),

(50, '2024-02-15 16:00:00', 45, 12800.00, 'ACT', 'CC', 'PEN');

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
