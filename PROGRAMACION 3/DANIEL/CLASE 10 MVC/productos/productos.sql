	CREATE TABLE productos (
		producto numeric(6) not null,
		descripcion char(120) not null,
		marca numeric(6) null,	-- codigo de marca de la tabla marcas.
		grupo char(3) null,	-- [COM:computacion/LIB:libreria,MAR:marroquineria]
		tipo char(3) null, -- [CPU:cpu/DIS:dicos/PER:perifericos/MON:monitores/IMP:impresoras]
		cantidad numeric(9,2) not null,
		punto_pedido numeric(9,2) null,
		precio_unitario money,
		estado char(3), -- [ACT/BAJ]
 	 CONSTRAINT pk_productos PRIMARY KEY NONCLUSTERED (producto))
	;


--delete productos

-- Laptops y CPUs
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (1001, 'Laptop Dell Latitude 5420 Intel i5 16GB RAM 512GB SSD', 10, 'COM', 'CPU', 25, 5, 1200.00, 'ACT');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (1002, 'PC Desktop HP ProDesk 400 G7 SFF Intel i7', 11, 'COM', 'CPU', 10, 2, 950.50, 'ACT');

-- Almacenamiento (Discos)
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (2001, 'Disco Duro Externo WD My Passport 2TB USB 3.0', 12, 'COM', 'DIS', 50, 10, 85.00, 'ACT');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (2002, 'SSD Samsung 980 Pro 1TB NVMe M.2', 13, 'COM', 'DIS', 15, 5, 140.00, 'ACT');

-- Periféricos
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (3001, 'Teclado Mecánico Logitech G Pro K/DA', 14, 'COM', 'PER', 30, 8, 110.00, 'ACT');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (3002, 'Mouse Inalámbrico Microsoft Bluetooth Black', 15, 'COM', 'PER', 100, 20, 25.99, 'ACT');

-- Monitores e Impresoras
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (4001, 'Monitor LG 27GL850-B 27" Nano IPS QHD', 16, 'COM', 'MON', 12, 3, 380.00, 'ACT');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (5001, 'Impresora Epson EcoTank L3210 Multifuncional', 17, 'COM', 'IMP', 8, 2, 210.00, 'ACT');

-- Otros grupos (Librería/Marroquinería)
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (6001, 'Mochila para Laptop Samsonite Guardit 2.0', 18, 'MAR', 'PER', 20, 4, 75.00, 'ACT');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (7001, 'Paquete de Papel A4 Report 500 hojas', 19, 'LIB', 'PER', 200, 50, 6.50, 'ACT');

-- Producto de baja (Para pruebas de filtrado)
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado)
VALUES (9999, 'Antiguo Monitor CRT 15 Pulgadas Genérico', 99, 'COM', 'MON', 0, 0, 10.00, 'BAJ');

INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8000, 'Cable HDMI 2.1 Acer Gamer Edition 201', 22, 'COM', 'PER', 95.33, 19.07, 2021.34, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8001, 'Mouse Gamer Lenovo Elite 480', 20, 'COM', 'PER', 17.3, 3.46, 2080.66, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8002, 'Mouse Gamer Epson Plus 805', 17, 'COM', 'PER', 102.65, 20.53, 1257.67, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8003, 'Auriculares con Mic Microsoft Office 446', 15, 'MAR', 'PER', 31.6, 6.32, 2051.08, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8004, 'Impresora Laser Acer Office 428', 22, 'COM', 'IMP', 69.17, 13.83, 2320.09, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8005, 'Cable HDMI 2.1 ViewSonic Pro 639', 27, 'LIB', 'PER', 86.51, 17.3, 920.29, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8006, 'Mini PC Canon Mini 519', 28, 'COM', 'CPU', 26.38, 5.28, 439.26, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8007, 'Servidor Tower Asus Series X 259', 21, 'COM', 'CPU', 95.99, 19.2, 1948.78, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8008, 'Tarjeta SD Dell Gamer Edition 811', 10, 'COM', 'DIS', 94.86, 18.97, 250.78, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8009, 'SSD SATA Western Digital Standard 442', 12, 'COM', 'DIS', 40.38, 8.08, 1332.87, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8010, 'Cable HDMI 2.1 Lenovo Max 295', 20, 'COM', 'PER', 145.36, 29.07, 2118.04, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8011, 'Workstation Epson Office 272', 17, 'COM', 'CPU', 13.44, 2.69, 1929.09, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8012, 'Tóner Negro Lenovo Plus 462', 20, 'COM', 'IMP', 142.94, 28.59, 265.84, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8013, 'Monitor Curvo Logitech Standard 636', 14, 'COM', 'MON', 123.8, 24.76, 2115.3, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8014, 'Pendrive LG Office 172', 16, 'COM', 'DIS', 97.27, 19.45, 2230.78, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8015, 'Impresora Laser Microsoft Office 300', 15, 'COM', 'IMP', 6.54, 1.31, 1638.87, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8016, 'Workstation Microsoft Office 117', 15, 'COM', 'CPU', 89.42, 17.88, 464.33, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8017, 'Tóner Negro Acer Standard 460', 22, 'COM', 'IMP', 96.81, 19.36, 1415.54, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8018, 'Servidor Tower Acer Mini 610', 22, 'COM', 'CPU', 106.4, 21.28, 427.76, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8019, 'Mouse Gamer Microsoft Office 289', 15, 'MAR', 'PER', 97.87, 19.57, 974.4, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8020, 'Auriculares con Mic Acer Office 773', 22, 'MAR', 'PER', 67.49, 13.5, 980.99, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8021, 'Monitor UltraWide Corsair Standard 526', 26, 'COM', 'MON', 122.09, 24.42, 1832.65, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8022, 'Monitor Curvo HP Elite 474', 11, 'COM', 'MON', 61.93, 12.39, 1401.8, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8023, 'Tarjeta SD Razer Series X 181', 25, 'COM', 'DIS', 43.92, 8.78, 1412.18, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8024, 'PC Desktop Crucial Office 563', 23, 'COM', 'CPU', 3.64, 0.73, 1876.44, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8025, 'Mouse Gamer Report Elite 851', 40, 'COM', 'PER', 130.92, 26.18, 2388.62, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8026, 'Disco Duro Externo Dell Standard 860', 10, 'COM', 'DIS', 58.31, 11.66, 1354.17, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8027, 'Mini PC Microsoft Max 598', 15, 'COM', 'CPU', 133.87, 26.77, 1650.39, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8028, 'Tarjeta SD Brother Elite 439', 29, 'COM', 'DIS', 61.09, 12.22, 225.0, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8029, 'Impresora Laser Acer Standard 214', 22, 'COM', 'IMP', 116.58, 23.32, 1973.29, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8030, 'Mouse Gamer Lenovo Max 905', 20, 'MAR', 'PER', 57.53, 11.51, 2350.25, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8031, 'Cartucho de color Brother Max 490', 29, 'COM', 'IMP', 53.81, 10.76, 1258.17, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8032, 'PC Desktop Logitech Office 317', 14, 'COM', 'CPU', 116.26, 23.25, 2243.94, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8033, 'Laptop Lenovo Elite 969', 20, 'COM', 'CPU', 129.67, 25.93, 309.52, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8034, 'Tarjeta SD Epson Plus 415', 17, 'COM', 'DIS', 46.83, 9.37, 380.94, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8035, 'Disco Duro Externo Western Digital Pro 507', 12, 'COM', 'DIS', 54.0, 10.8, 706.39, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8036, 'Impresora Tinta Continua Samsung Plus 524', 13, 'COM', 'IMP', 110.37, 22.07, 2007.04, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8037, 'PC Desktop Dell Series X 401', 10, 'COM', 'CPU', 40.26, 8.05, 1815.51, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8038, 'Tarjeta SD LG Plus 563', 16, 'COM', 'DIS', 13.7, 2.74, 2324.56, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8039, 'PC Desktop Dell Series X 743', 10, 'COM', 'CPU', 23.45, 4.69, 255.42, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8040, 'Workstation Lenovo Pro 682', 20, 'COM', 'CPU', 13.5, 2.7, 92.13, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8041, 'Pendrive Lenovo Mini 803', 20, 'COM', 'DIS', 20.07, 4.01, 1142.68, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8042, 'PC Desktop ViewSonic Gamer Edition 427', 27, 'COM', 'CPU', 11.84, 2.37, 1016.9, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8043, 'Auriculares con Mic HP Elite 743', 11, 'COM', 'PER', 111.14, 22.23, 1492.36, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8044, 'Monitor UltraWide Corsair Pro 751', 26, 'COM', 'MON', 101.38, 20.28, 896.76, 'BAJ');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8045, 'Cartucho de color Asus Max 991', 21, 'COM', 'IMP', 58.25, 11.65, 296.24, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8046, 'Monitor UltraWide ViewSonic Office 911', 27, 'COM', 'MON', 145.67, 29.13, 1911.49, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8047, 'Mouse Gamer Dell Pro 924', 10, 'LIB', 'PER', 105.07, 21.01, 2269.34, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8048, 'Workstation HP Plus 366', 11, 'COM', 'CPU', 93.76, 18.75, 1348.97, 'ACT');
INSERT INTO productos (producto, descripcion, marca, grupo, tipo, cantidad, punto_pedido, precio_unitario, estado) VALUES (8049, 'Disco Duro Externo Asus Office 137', 21, 'COM', 'DIS', 52.13, 10.43, 1480.4, 'BAJ');


INSERT INTO productos VALUES (8050, 'Teclado Mecanico RGB Razer BlackWidow V3', 25, 'COM', 'PER', 45, 10, 159.99, 'ACT');
INSERT INTO productos VALUES (8051, 'Monitor Curvo Samsung Odyssey G5 27"', 13, 'COM', 'MON', 15, 3, 299.50, 'ACT');
INSERT INTO productos VALUES (8052, 'Impresora Multifuncion HP Smart Tank 515', 11, 'COM', 'IMP', 8, 2, 245.00, 'ACT');
INSERT INTO productos VALUES (8053, 'Memoria RAM Corsair Vengeance 16GB DDR4', 26, 'COM', 'CPU', 60, 15, 85.20, 'ACT');
INSERT INTO productos VALUES (8054, 'Disco Solido Kingston A400 480GB SATA', 30, 'COM', 'DIS', 120, 25, 42.00, 'ACT');
INSERT INTO productos VALUES (8055, 'Mochila Antirrobo para Notebook 15.6" Black', 18, 'MAR', 'PER', 35, 5, 55.00, 'ACT');
INSERT INTO productos VALUES (8056, 'Mouse Logi Pebble M350 Inalambrico Rosa', 14, 'COM', 'PER', 80, 20, 29.90, 'ACT');
INSERT INTO productos VALUES (8057, 'Procesador Intel Core i9-12900K Box', 10, 'COM', 'CPU', 12, 2, 650.00, 'ACT');
INSERT INTO productos VALUES (8058, 'Gabinete Thermaltake V200 Tempered Glass', 31, 'COM', 'CPU', 22, 5, 95.00, 'ACT');
INSERT INTO productos VALUES (8059, 'Papel Fotografico Epson Glossy A4 x20', 17, 'LIB', 'PER', 200, 40, 12.50, 'ACT');
INSERT INTO productos VALUES (8060, 'Placa de Video ASUS RTX 3060 12GB GDDR6', 21, 'COM', 'CPU', 7, 2, 480.00, 'ACT');
INSERT INTO productos VALUES (8061, 'Fuente de Poder EVGA 600W 80 Plus White', 32, 'COM', 'CPU', 25, 6, 75.40, 'ACT');
INSERT INTO productos VALUES (8062, 'Auriculares HyperX Cloud II Red 7.1', 33, 'COM', 'PER', 40, 8, 99.00, 'ACT');
INSERT INTO productos VALUES (8063, 'Scanner Canon CanoScan LiDE 300', 28, 'COM', 'PER', 15, 3, 110.00, 'ACT');
INSERT INTO productos VALUES (8064, 'Webcam Logitech C920s Pro HD 1080p', 14, 'COM', 'PER', 55, 10, 89.99, 'ACT');
INSERT INTO productos VALUES (8065, 'Disco Duro WD Blue 1TB 7200RPM', 12, 'COM', 'DIS', 90, 20, 52.00, 'ACT');
INSERT INTO productos VALUES (8066, 'Cable de Red UTP Cat6 10 Metros Gris', 22, 'COM', 'PER', 150, 30, 15.00, 'ACT');
INSERT INTO productos VALUES (8067, 'Pad Mouse SteelSeries QcK Heavy Large', 34, 'COM', 'PER', 65, 12, 25.00, 'ACT');
INSERT INTO productos VALUES (8068, 'Toner HP 85A Negro Original CE285A', 11, 'COM', 'IMP', 30, 5, 88.00, 'ACT');
INSERT INTO productos VALUES (8069, 'Funda de Neoprene 14" Reversible Azul', 18, 'MAR', 'PER', 100, 15, 18.50, 'ACT');
INSERT INTO productos VALUES (8070, 'Silla Gamer Corsair T3 Rush Grey/White', 26, 'COM', 'PER', 5, 1, 350.00, 'ACT');
INSERT INTO productos VALUES (8071, 'Switch TP-Link 8 Puertos Gigabit Desktop', 35, 'COM', 'PER', 40, 10, 32.00, 'ACT');
INSERT INTO productos VALUES (8072, 'Placa Madre MSI B550M PRO-VDH WiFi', 36, 'COM', 'CPU', 18, 4, 145.00, 'ACT');
INSERT INTO productos VALUES (8073, 'Sistema de Tinta Brother MFC-T920DW', 29, 'COM', 'IMP', 6, 2, 420.00, 'ACT');
INSERT INTO productos VALUES (8074, 'Micro SD SanDisk Ultra 128GB Clase 10', 37, 'COM', 'DIS', 250, 50, 22.00, 'ACT');
INSERT INTO productos VALUES (8075, 'Base Refrigerante para Laptop DeepCool', 38, 'COM', 'PER', 30, 5, 28.00, 'ACT');
INSERT INTO productos VALUES (8076, 'Pasta Termica Noctua NT-H1 3.5g', 39, 'COM', 'CPU', 100, 20, 15.00, 'ACT');
INSERT INTO productos VALUES (8077, 'Monitor Dell UltraSharp 24" U2422H', 10, 'COM', 'MON', 20, 5, 275.00, 'ACT');
INSERT INTO productos VALUES (8078, 'Cartucho HP 667XL Negro High Yield', 11, 'COM', 'IMP', 85, 20, 35.00, 'ACT');
INSERT INTO productos VALUES (8079, 'Router Wi-Fi 6 ASUS RT-AX58U Dual Band', 21, 'COM', 'PER', 15, 3, 185.00, 'ACT');
INSERT INTO productos VALUES (8080, 'Disco SSD NVMe WD Black SN850 1TB', 12, 'COM', 'DIS', 22, 5, 165.00, 'ACT');
INSERT INTO productos VALUES (8081, 'Mochila Case Logic 17" Professional', 18, 'MAR', 'PER', 12, 3, 85.00, 'ACT');
INSERT INTO productos VALUES (8082, 'Teclado Numerico USB Genius i120', 40, 'COM', 'PER', 60, 10, 12.00, 'ACT');
INSERT INTO productos VALUES (8083, 'Cable DisplayPort 1.4 2 Metros', 22, 'COM', 'PER', 80, 15, 18.00, 'ACT');
INSERT INTO productos VALUES (8084, 'Procesador AMD Ryzen 7 5800X Sin Cooler', 41, 'COM', 'CPU', 10, 2, 380.00, 'ACT');
INSERT INTO productos VALUES (8085, 'Memoria USB Kingston DataTraveler 64GB', 30, 'COM', 'DIS', 300, 60, 12.50, 'ACT');
INSERT INTO productos VALUES (8086, 'Calculadora Cientifica Casio fx-991LAX', 42, 'LIB', 'PER', 50, 10, 45.00, 'ACT');
INSERT INTO productos VALUES (8087, 'Hub USB-C 7 en 1 Anker PowerExpand', 43, 'COM', 'PER', 25, 5, 65.00, 'ACT');
INSERT INTO productos VALUES (8088, 'Caja de Disquetes 3.5 Verbatim (Vintage)', 44, 'COM', 'DIS', 0, 0, 5.00, 'BAJ');
INSERT INTO productos VALUES (8089, 'Papel Continuo 9.5x11 Blanco 1 Parte', 19, 'LIB', 'PER', 40, 10, 25.00, 'ACT');
INSERT INTO productos VALUES (8090, 'Servidor Rack Dell PowerEdge R440', 10, 'COM', 'CPU', 3, 1, 2800.00, 'ACT');
INSERT INTO productos VALUES (8091, 'Impresora Termica Zebra ZD220 Desktop', 45, 'COM', 'IMP', 12, 3, 195.00, 'ACT');
INSERT INTO productos VALUES (8092, 'Cargador Anker para Laptop 90W', 43, 'COM', 'PER', 50, 10, 35.00, 'ACT');
INSERT INTO productos VALUES (8093, 'Mini Teclado Inalambrico con Touchpad', 40, 'COM', 'PER', 45, 5, 22.00, 'ACT');
INSERT INTO productos VALUES (8094, 'Disco Rigido para Surveillance WD Purple 4TB', 12, 'COM', 'DIS', 18, 4, 115.00, 'ACT');
INSERT INTO productos VALUES (8095, 'Monitor Gamer Acer Nitro 24" 165Hz', 22, 'COM', 'MON', 25, 6, 210.00, 'ACT');
INSERT INTO productos VALUES (8096, 'Tarjeta de Sonido Creative Sound Blaster', 47, 'COM', 'PER', 10, 2, 140.00, 'ACT');
INSERT INTO productos VALUES (8097, 'Mando Microsoft Xbox Wireless Carbon Black', 15, 'COM', 'PER', 35, 8, 65.00, 'ACT');
INSERT INTO productos VALUES (8098, 'Bateria para UPS APC Replacement 12V', 48, 'COM', 'PER', 20, 5, 45.00, 'ACT');
INSERT INTO productos VALUES (8099, 'Escritorio Oficina Minimalista Roble', 99, 'LIB', 'PER', 10, 2, 120.00, 'ACT');
-- (Registros del 8100 al 8149 resumidos por espacio)
INSERT INTO productos VALUES (8100, 'Ssd M.2 Crucial P5 Plus 500GB', 23, 'COM', 'DIS', 40, 10, 78.00, 'ACT');
INSERT INTO productos VALUES (8101, 'Impresora Canon Pixma G3110', 28, 'COM', 'IMP', 14, 4, 185.00, 'ACT');
INSERT INTO productos VALUES (8102, 'Toner Brother TN-2370 Negro', 29, 'COM', 'IMP', 50, 10, 55.00, 'ACT');
INSERT INTO productos VALUES (8103, 'Monitor ViewSonic 19" LED Office', 27, 'COM', 'MON', 30, 5, 115.00, 'ACT');
INSERT INTO productos VALUES (8104, 'Mouse Gamer Logitech G502 Hero', 14, 'COM', 'PER', 70, 15, 49.99, 'ACT');
INSERT INTO productos VALUES (8105, 'Auriculares Sennheiser HD 25', 50, 'COM', 'PER', 12, 3, 149.00, 'ACT');
INSERT INTO productos VALUES (8106, 'Cable de Poder Interlock 1.5m', 22, 'COM', 'PER', 200, 50, 4.50, 'ACT');
INSERT INTO productos VALUES (8107, 'Bolso Neoprene Tablet 10"', 18, 'MAR', 'PER', 60, 10, 12.00, 'ACT');
INSERT INTO productos VALUES (8108, 'Gabinete Cooler Master TD500', 99, 'COM', 'CPU', 15, 4, 125.00, 'ACT');
INSERT INTO productos VALUES (8109, 'Fuente Gigabyte 750W 80+ Gold', 52, 'COM', 'CPU', 22, 5, 110.00, 'ACT');
INSERT INTO productos VALUES (8110, 'Router Linksys Velop Mesh WiFi', 35, 'COM', 'PER', 10, 2, 280.00, 'ACT');
INSERT INTO productos VALUES (8111, 'Adaptador USB Bluetooth 5.0 TP-Link', 35, 'COM', 'PER', 120, 25, 15.00, 'ACT');
INSERT INTO productos VALUES (8112, 'Microfono Blue Yeti Silver USB', 14, 'COM', 'PER', 18, 4, 129.00, 'ACT');
INSERT INTO productos VALUES (8113, 'Disco Externo Toshiba Canvio 4TB', 54, 'COM', 'DIS', 35, 8, 105.00, 'ACT');
INSERT INTO productos VALUES (8114, 'Monitor MSI Optix G24C4 Curvo', 36, 'COM', 'MON', 15, 3, 225.00, 'ACT');
INSERT INTO productos VALUES (8115, 'PC All-in-One Lenovo IdeaCentre 3', 20, 'COM', 'CPU', 8, 2, 650.00, 'ACT');
INSERT INTO productos VALUES (8116, 'Tableta Digitalizadora Wacom Intuos', 55, 'COM', 'PER', 25, 5, 89.00, 'ACT');
INSERT INTO productos VALUES (8117, 'Lector de Codigo de Barras Honeywell', 56, 'COM', 'PER', 30, 5, 135.00, 'ACT');
INSERT INTO productos VALUES (8118, 'Papel A4 Ledesma 75g x 500 hojas', 19, 'LIB', 'PER', 500, 100, 7.20, 'ACT');
INSERT INTO productos VALUES (8119, 'Marcadores Sharpie x12 Colores', 57, 'LIB', 'PER', 150, 30, 14.00, 'ACT');
INSERT INTO productos VALUES (8120, 'Teclado Microsoft Wired 600', 15, 'COM', 'PER', 80, 20, 18.00, 'ACT');
INSERT INTO productos VALUES (8121, 'Ssd Sata Crucial MX500 1TB', 23, 'COM', 'DIS', 45, 10, 95.00, 'ACT');
INSERT INTO productos VALUES (8122, 'Motherboard Gigabyte Z690 Gaming X', 52, 'COM', 'CPU', 10, 2, 240.00, 'ACT');
INSERT INTO productos VALUES (8123, 'Kit Limpieza Pantallas 2 en 1', 99, 'LIB', 'PER', 100, 20, 8.50, 'ACT');
INSERT INTO productos VALUES (8124, 'Joystick Sony PS5 DualSense White', 59, 'COM', 'PER', 40, 10, 75.00, 'ACT');
INSERT INTO productos VALUES (8125, 'Switch Cisco Business 110-8T-D', 60, 'COM', 'PER', 12, 3, 145.00, 'ACT');
INSERT INTO productos VALUES (8126, 'Monitor HP M24fw FHD Ultra-Slim', 11, 'COM', 'MON', 20, 5, 189.00, 'ACT');
INSERT INTO productos VALUES (8127, 'Cartucho Epson 664 Black EcoTank', 17, 'COM', 'IMP', 200, 50, 14.00, 'ACT');
INSERT INTO productos VALUES (8128, 'Cooler Master Hyper 212 RGB Black', 41, 'COM', 'CPU', 35, 10, 55.00, 'ACT');
INSERT INTO productos VALUES (8129, 'Pasta Termica Arctic MX-4 4g', 61, 'COM', 'CPU', 120, 20, 12.00, 'ACT');
INSERT INTO productos VALUES (8130, 'Disco Rigido Seagate IronWolf 8TB NAS', 62, 'COM', 'DIS', 12, 3, 235.00, 'ACT');
INSERT INTO productos VALUES (8131, 'Laptop Gaming ASUS ROG Strix G15', 21, 'COM', 'CPU', 5, 1, 1450.00, 'ACT');
INSERT INTO productos VALUES (8132, 'Mouse Microsoft Ocean Plastic Mouse', 15, 'COM', 'PER', 50, 10, 35.00, 'ACT');
INSERT INTO productos VALUES (8133, 'Calculadora Cientifica HP 300s+', 11, 'LIB', 'PER', 40, 8, 38.00, 'ACT');
INSERT INTO productos VALUES (8134, 'Protector de Tension 6 Tomas', 43, 'COM', 'PER', 150, 30, 22.00, 'ACT');
INSERT INTO productos VALUES (8135, 'Tinta HP GT52 Cyan Original', 11, 'COM', 'IMP', 80, 15, 12.00, 'ACT');
INSERT INTO productos VALUES (8136, 'Auriculares JBL Quantum 100 Wired', 63, 'COM', 'PER', 60, 15, 45.00, 'ACT');
INSERT INTO productos VALUES (8137, 'Mochila Targus Intellect 15.6"', 64, 'MAR', 'PER', 45, 10, 35.00, 'ACT');
INSERT INTO productos VALUES (8138, 'Webcam Redragon Fobos GW600 720P', 65, 'COM', 'PER', 55, 10, 38.00, 'ACT');
INSERT INTO productos VALUES (8139, 'Ssd Kingston NV2 1TB PCIe 4.0', 30, 'COM', 'DIS', 75, 15, 72.00, 'ACT');
INSERT INTO productos VALUES (8140, 'Memoria Sodimm DDR4 8GB Crucial', 23, 'COM', 'CPU', 100, 20, 28.00, 'ACT');
INSERT INTO productos VALUES (8141, 'Placa Madre ASRock B450 Steel Legend', 66, 'COM', 'CPU', 12, 3, 115.00, 'ACT');
INSERT INTO productos VALUES (8142, 'Monitor BenQ ZOWIE XL2411K 144Hz', 67, 'COM', 'MON', 10, 2, 260.00, 'ACT');
INSERT INTO productos VALUES (8143, 'Impresora de Etiquetas Dymo LabelManager', 68, 'LIB', 'PER', 20, 5, 55.00, 'ACT');
INSERT INTO productos VALUES (8144, 'Extensor WiFi TP-Link RE200 AC750', 35, 'COM', 'PER', 45, 10, 28.00, 'ACT');
INSERT INTO productos VALUES (8145, 'Kit Teclado y Mouse Inalambrico Dell', 10, 'COM', 'PER', 60, 15, 42.00, 'ACT');
INSERT INTO productos VALUES (8146, 'Cable Adaptador DP a HDMI 1.8m', 22, 'COM', 'PER', 90, 15, 14.00, 'ACT');
INSERT INTO productos VALUES (8147, 'Pila CR2032 Litio 3V para Motherboard', 99, 'COM', 'CPU', 500, 100, 1.50, 'ACT');
INSERT INTO productos VALUES (8148, 'Funda Tablet 7" Universal Silicona', 18, 'MAR', 'PER', 80, 20, 8.00, 'ACT');
INSERT INTO productos VALUES (8149, 'Mousepad Razer Goliathus Control M', 25, 'COM', 'PER', 50, 10, 22.00, 'ACT');
INSERT INTO productos VALUES (8150, 'MacBook Pro M4 16GB ssd 1TB', 69, 'COM', 'PER', 50, 10, 1250.00, 'ACT');


--select * from productos where marca not in (select marca from marcas)
