DROP DATABASE IF EXISTS morhealth;
CREATE SCHEMA morhealth;
USE morhealth;

CREATE TABLE `morhealth`.`client` (
  `username` VARCHAR(12) NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  `lastname_p` VARCHAR(12) NOT NULL,
  `lastname_m` VARCHAR(12) NOT NULL,
  `gender` CHAR(1) NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pswd` VARCHAR(12) NOT NULL,
  `client_image` VARCHAR(45) NULL,
  PRIMARY KEY (`username`));
  
CREATE TABLE `morhealth`.`diet` (
  `id_diet` INT NOT NULL AUTO_INCREMENT,
  `diet_name` VARCHAR(12) NOT NULL,
  `diet_tag` VARCHAR(16) NOT NULL,
  `username` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_diet`),
  INDEX `username_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `morhealth`.`client` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `morhealth`.`dish` (
  `id_dish` INT NOT NULL AUTO_INCREMENT,
  `dish_name` VARCHAR(45) NOT NULL,
  `dish_desc` VARCHAR(250) NOT NULL,
  `dish_veg` TINYINT(1) NOT NULL,
  `dish_cat` VARCHAR(12) NOT NULL,
  `dish_tag` VARCHAR(12) NOT NULL,
  `dish_det` JSON NOT NULL,
  PRIMARY KEY (`id_dish`));
  
CREATE TABLE `morhealth`.`didi` (
  `id_didi` INT NOT NULL AUTO_INCREMENT,
  `id_diet` INT NOT NULL,
  `id_dish` INT NOT NULL,
  
  PRIMARY KEY (`id_didi`),
  
  INDEX `id_diet_idx` (`id_diet` ASC) VISIBLE,
  INDEX `id_dish_idx` (`id_dish` ASC) VISIBLE,
  
  CONSTRAINT `id_diet`
    FOREIGN KEY (`id_diet`)
    REFERENCES `morhealth`.`diet` (`id_diet`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
  CONSTRAINT `id_dish`
    FOREIGN KEY (`id_dish`)
    REFERENCES `morhealth`.`dish` (`id_dish`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `morhealth`.`metric` (
  `id_metric` INT NOT NULL AUTO_INCREMENT,
  `calories` INT NOT NULL,
  `water` FLOAT NOT NULL,
  `steps` INT NOT NULL,
  `height` FLOAT NOT NULL,
  `sleep_time` FLOAT NOT NULL,
  `emotions` INT NOT NULL,
  `date` DATE NOT NULL,
  `weight` FLOAT NOT NULL,
  PRIMARY KEY (`id_metric`));
  
  CREATE TABLE `morhealth`.`climet` (
  `id_climet` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(12) NOT NULL,
  `id_metric` INT NOT NULL,
  PRIMARY KEY (`id_climet`),
  INDEX `client_idx` (`username` ASC) VISIBLE,
  INDEX `idmetric_idx` (`id_metric` ASC) VISIBLE,
  CONSTRAINT `client`
    FOREIGN KEY (`username`)
    REFERENCES `morhealth`.`client` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idmetric`
    FOREIGN KEY (`id_metric`)
    REFERENCES `morhealth`.`metric` (`id_metric`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
# DML QUIERIES
-- Inserts
-- INSERT_CLIENT
INSERT INTO `morhealth`.`client`(`username`,`name`, `lastname_p`, `lastname_m`, `gender`, `age`, `email`, `pswd`, `client_image`) VALUES ('Sawalito', 'Saul Ubaldo', 'Rojas', 'Vazquez', 'M', 18, 'sawalillo@mail.com', 'sawalitogod', 'image_1');
INSERT INTO `morhealth`.`client`(`username`,`name`, `lastname_p`, `lastname_m`, `gender`, `age`, `email`, `pswd`, `client_image`) VALUES ('Chunkdunk', 'Julio Cesar', 'Valencia', 'Granada', 'M', 18, 'chunkdunk@mail.com', 'julius', 'image_3');

-- INSERT_DISH
INSERT INTO `morhealth`.`dish`(`dish_name`, `dish_desc`, `dish_veg`, `dish_cat`, `dish_tag`, `dish_det`) VALUES ('Tortilla Espa??ola', 'Este delicioso plato ofrece una gran variedad de verduras saludables para tu diabetes. Esta tortilla para diab??ticos puede ser servida en el desayuno, a media ma??ana o en cualquiera de las tres comidas principales.', 0, 'Postres', 'Diabetes', '{"nombre":"TORTILLA ESPA??OLA","descripcion":"Este delicioso plato ofrece una gran variedad de verduras saludables para tu diabetes.Esta tortilla para diab??ticos puede ser servida en el desayuno, a media ma??ana o en cualquiera de las tres comidas principales. Puedes darte el gusto y servir con ensalada de fruta, un vaso de agua y pan integral. Recuerda que todo exceso es malo as?? que se consiente de las porciones que comer??s. La tortilla de patatas, de papas o tortilla espa??ola es una tortilla u omelet??? a la que se le agrega patatas troceadas. Se trata de uno de los platos m??s conocidos y emblem??ticos de la cocina espa??ola, siendo un producto muy popular que se puede encontrar en casi cualquier bar o restaurante del pa??s.4 A partir de la receta b??sica hay m??ltiples variantes, tanto en el modo de cocinar los ingredientes como en el cuajado del huevo.","calorias":"210","tiempoPrep":"60","ingredientes":["5 papas peque??as, peladas y cortadas (alrededor de 1.25 libras de peso en total)","Aceite vegetal para cocinar en spray media cebolla mediana picada finamente","1 calabac??n verde peque??o cortado en rodajas ","1.5 taza de pimientos verdes o rojos cortados en rodajas finas","5 champi??ones medianos en rodajas","3 huevos enteros batidos","5 claras de huevo batidas","Pimienta y sal de ajo con hierbas a gusto","3 onzas de queso mozzarella de bajo contenido graso rallado","1 cucharada de queso parmesano de bajo contenido graso"],"receta":["Precaliente el horno a 375 grados F.","Cocine las papas en agua hirviendo hasta que se ablanden.","En una sart??n antiadherente, roc??e el aceite vegetal y caliente a fuego medio.","A??ada la cebolla y sofr??a hasta que se dore. A??ada las verduras y sofr??a hasta que se ablanden, pero sin dorarlas.","En un recipiente mediano, bata ligeramente los huevos y las claras de huevo, la pimienta, la sal de ajo y el queso mozzarella de bajo contenido graso. A??ada la mezcla de huevos con queso a las verduras cocidas.","Roc??e el aceite vegetal en una cacerola para hornear de 10 pulgadas o en una sart??n que se pueda meter al horno y vierta en ella la mezcla de huevos y papas. Esparza por encima el queso parmesano de bajo contenido graso y hornee la tortilla hasta que est?? firme y dorada en la superficie, entre 20 y 30 minutos.","Saque la tortilla del horno, d??jela enfriar por 10 minutos y corte en cinco pedazos."]}' );
INSERT INTO `morhealth`.`dish`(`dish_name`, `dish_desc`, `dish_veg`, `dish_cat`, `dish_tag`, `dish_det`) VALUES ('Ensalada Cesar con pollo', ' ensalada de lechuga romana y cro??tons (trozos de pan tostado) con jugo de lim??n, aceite de oliva, huevo, salsa Worcestershire, anchoas, ajo, mostaza de Dijon, queso parmesano y pimienta negra.', 0, 'Verduras', 'Ensaladas', '{"nombre":"Ensalada C??sar con Pollo","descripcion":"Una ensalada C??sar es una ensalada de lechuga romana y cro??tons (trozos de pan tostado) con jugo de lim??n, aceite de oliva, huevo, salsa Worcestershire, anchoas, ajo, mostaza de Dijon, queso parmesano y pimienta negra. La ensalada C??sar original no contiene pollo, aunque se le suele agregar habitualmente. El inventor de esta ensalada fue el chef del restaurante Cardini, Remigio Murgia, aunque el platillo se nombr?? ensalada C??sar en honor al due??o y tambi??n cocinero C??sar Cardini. Esta ensalada es muy popular y ha llegado a internacionalizarse, siendo posible encontrarla en variados restaurantes del mundo. En su forma original, esta ensalada era preparada al momento delante del comensal y servida a un lado de la mesa.","calorias":"350000","tiempoPrep":"25","ingredientes":["1 cabeza grande de lechuga","400 gramos pechuga de pollo cortado en cuadros, cocida y sin piel ","queso parmesano para decorar","50 gramos de pan integral cortado en cubos","3 dientes de ajo finamente picado","1 chorro de aceite de oliva virgen extra","50 gramos de queso parmesano","120 ml yogurt natural bajo en grasa","1 cda aceite de oliva extra virgen","1 cdita de mostaza dijon","2 cdas de zumo de lim??n jugo de lim??n fresco"],"receta":["Desojamos, lavamos las lechugas, colamos y las dejamos secar en un recipiente","Para los croutones pelamos los dientes de ajo, los cortamos en trozos peque??os y los mezclamos con un chorro de aceite de oliva podemos dejarlo un momento para que vaya tomando fuerza, seguidamente cortamos el pan integral en cuadritos y los mezclamos con el ajo y aceite que acabamos de preparar. Pasamos a poner todo esto en una sart??n y lo vamos cocinando hasta que el pan est?? tostado, hay que ir movi??ndolo para evitar que se quemen.","Para la vinagreta combinamos el yogurt natural con el aceite de oliva, seguidamente agregamos el queso parmesano, no olvides dejar un poco para el final, agregamos el zumo de lim??n, la mostaza y vamos probando mientras agregamos un poco de sal hasta que est?? a tu gusto.","Finalmente cocinamos el pollo en una sart??n, agregamos sal y pimienta al gusto, en realidad no hay necesidad de adicionar aceite.","Servimos la ensalada con la lechuga cortada o troceada, ponemos los cuadritos de pollo, los croutones, la vinagreta y un poco de queso parmesano que qued?? para decorar, espero que esta receta te haya fascinado."]}');

-- INSERT DIET
INSERT INTO `morhealth`.`diet`(`diet_name`, `diet_tag`, `username`) VALUES ('Definicion', 'vegana', 'Sawalito');
INSERT INTO `morhealth`.`diet`(`diet_name`, `diet_tag`, `username`) VALUES ('Volumen', 'carnes', 'Sawalito');
INSERT INTO `morhealth`.`diet`(`diet_name`, `diet_tag`, `username`) VALUES ('Enero', '', 'Sawalito');
INSERT INTO `morhealth`.`diet`(`diet_name`, `diet_tag`, `username`) VALUES ('Volumensillo', '', 'Chunkdunk');

-- INSERT_DISH_INTO_DIET
INSERT INTO `morhealth`.`didi`(`id_diet`, `id_dish`) VALUES (2, 2);

-- SEARCH_CLIENT_BY_USERNAME_AND_PASSWORD
SELECT * FROM `morhealth`.`client` WHERE `username` = 'Sawalito' AND `pswd` = 'sawalitogod';

-- SELECT_DIETS
SELECT * FROM `morhealth`.`diet` WHERE username = 'Sawalito';

-- SELECT_DISH_DETAIL_BY_ID
SELECT JSON_EXTRACT(`dish_det`, '$.nombre') AS name, JSON_EXTRACT(`dish_det`, '$.descripcion') AS description, JSON_EXTRACT(`dish_det`, '$.calorias') AS calories, JSON_EXTRACT(`dish_det`, '$.tiempoPrep') AS prepTime, JSON_EXTRACT(`dish_det`, '$.ingredientes') AS ingredients, JSON_EXTRACT(`dish_det`, '$.receta') AS recipe FROM `morhealth`.`dish` WHERE `id_dish` = 1;
SELECT  JSON_EXTRACT(`dish_det`, '$.receta') AS recipe FROM `morhealth`.`dish` WHERE `id_dish` = 2;

SELECT * FROM `morhealth`.`dish`; 
SELECT * FROM `morhealth`.`didi`;

-- SELECT_DISH_INGREDIENT_BY_ID
SELECT JSON_EXTRACT(`dish_det`, '$.ingredientes[0]') AS ingredient FROM `morhealth`.`dish` WHERE `id_dish` = 2;

-- SELECT_DISHES_BY_DIET
SELECT * FROM `morhealth`.`dish` WHERE `id_dish` IN (SELECT `id_dish` FROM `morhealth`.`didi` WHERE `id_diet` = 10);

-- SELECT_DISH_STEP_BY_ID
SELECT JSON_EXTRACT(`dish_det`, '$.receta[0]') AS step FROM `morhealth`.`dish` WHERE `id_dish` = 2;

SELECT `dish_name`, JSON_EXTRACT(`dish_det`, '$.calorias') AS calorias FROM `morhealth`.`dish`;