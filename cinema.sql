CREATE DATABASE "cinema";
Use cinema;


CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `firstName` varchar(50),
  `email` varchar(100),
  `lastname` varchar(50),
  `birthday` date,
  `password` varchar(100),
  `role` varchar(50),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `booking` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nameBooking` varchar(100),
  `numberPlace` int,
  `seatNumber` int,
  `created_at` timestamp,
  `updated_at` timestamp,
  `id_user` int,
  `id_CinemaShow` int
);

CREATE TABLE `cinemaShow` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `startDate` date,
  `endDate` date,
  `seatAvaible` date,
  `price` float,
  `id_room` int,
  `id_film` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `room` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `seatNumber` int,
  `seatRank` int,
  `seatline` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `movie` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(150),
  `description` TEXT,
  `duration` int,
  `image` varchar(100),
  `durationStart` date,
  `durationEnd` date,
  `author` TEXT,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `discountCard` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nameDiscount` varchar(100),
  `descriptionDiscount` text,
  `pourcent` float,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `Discount_Booking` (
  `id_booking` int,
  `id_discountCard` int
);

ALTER TABLE `booking` ADD FOREIGN KEY (`id`) REFERENCES `Discount_Booking` (`id_booking`);

ALTER TABLE `discountCard` ADD FOREIGN KEY (`id`) REFERENCES `Discount_Booking` (`id_discountCard`);

ALTER TABLE `booking` ADD FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

ALTER TABLE `booking` ADD FOREIGN KEY (`id_CinemaShow`) REFERENCES `cinemaShow` (`id`);

ALTER TABLE `cinemaShow` ADD FOREIGN KEY (`id_room`) REFERENCES `room` (`id`);

ALTER TABLE `cinemaShow` ADD FOREIGN KEY (`id_film`) REFERENCES `movie` (`id`);

--
-- Contenu de la table `movie`
--


INSERT INTO movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Oscar et le monde des chats', 'Oscar est un chaton qui vit paisiblement avec son père Léon, un gros chat d/’appartement. Rêveur, il croit en l/’existence de Catstopia, un monde merveilleux où vivent les chats. Il décide un jour de partir à l/’aventure !','87', '2779101.jpg', '20231018', '20231101','Jean-Michel Vovk, Charlie Langendries, Ioanna Gkizas , Franck Dacquin', '20231017', null );
INSERT INTO  movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Astérix - Le Secret de la Potion Magique','À la suite d’une chute lors de la cueillette du gui, le druide Panoramix décide qu’il est temps d’assurer l’avenir du village. Accompagné d’Astérix et Obélix, il entreprend de parcourir le monde gaulois à la recherche d’un jeune druide talentueux à qui transmettre le Secret de la Potion Magique…' ,'95','1793011.jpg','20231018' , '20231101', 'Christian Clavier, Guillaume Briat, Daniel Mesguich, Alexandre Astier, Elie Semoun', '20231017', null );
INSERT INTO  movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Le Gendre de ma vie', 'Stéphane et Suzanne sont parents de trois jeunes femmes, le tableau peut sembler idéal mais Stéphane n’a jamais eu de fils et a toujours rêvé d’en avoir. Pour combler cette frustration, il s’accapare ses gendres et en tombe plus vite amoureux que ses filles.', '117','3261460.jpg','20231018' , '20231101','Kad Merad, Pauline Etienne, Julie Gayet, François Deblock, Zabou Breitman', '20231017', null );
INSERT INTO  movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Rémi sans famille','Les aventures du jeune Rémi, orphelin recueilli par la douce Madame Barberin. A l’âge de 10 ans, il est arraché à sa mère adoptive et confié au Signor Vitalis, un mystérieux musicien ambulant. A ses côtés, il va apprendre la rude vie de saltimbanque et à chanter pour gagner son pain.', '109', '5560173.jpg','20231018' , '20231101', 'Daniel Auteuil, Virginie Ledoyen, Ludivine Sagnier, Jonathan Zaccaï, Jacques Perrin', '20231017', null );
INSERT INTO  movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Le Retour de Mary Poppins','Michael et Jane sont désormais adultes. Michael vit sur Cherry Tree Lane avec ses trois enfants et leur gouvernante, Ellen. Lorsque celui-ci perd un proche, Mary Poppins, l’énigmatique nounou, réapparaît dans la vie de la famille Banks.', '124', '3191210.jpg','20231018' , '20231101', 'Emily Blunt, Lin-Manuel Miranda, Ben Whishaw, Emily Mortimer, Pixie Davies', '20231017', null );
INSERT INTO movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Pachamama','Tepulpaï et Naïra, deux petits indiens de la Cordillère des Andes, partent à la poursuite de la Huaca, totem protecteur de leur village, confisqué par les Incas. Leur quête les mènera jusqu’à Cuzco, capitale royale assiégée par les conquistadors.', '72', '5452144.jpg','20231018' , '20231101', 'Andrea Santamaria, India Coenen, Saïd Amadis, Marie-Christine Darah, Vincent Ropion', '20231017', null );
INSERT INTO movie (title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at)
values ('Mia et le Lion Blanc','Mia a 11 ans quand elle noue une relation hors du commun avec Charlie, un lionceau blanc né dans la ferme d''élevage de félins de ses parents en Afrique du Sud. Pendant trois ans, ils vont grandir ensemble et vivre une amitié fusionnelle. Quand Mia atteint l''âge de 14 ans elle découvre l’insoutenable vérité : son père a décidé de le vendre à des chasseurs de trophées. ', '98', '5452144.jpg','20231018' , '20231101', 'Daniah De Villiers, Mélanie Laurent, Langley Kirkwood, Ryan Mac Lennan, Lionel Newton', '20231017', null );


CREATE TABLE `item` (
                        `id` int(11) UNSIGNED NOT NULL,
                        `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `item`
--

INSERT INTO `item` (`id`, `title`) VALUES
                                       (1, 'Stuff'),
                                       (2, 'Doodads');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `item`
--
ALTER TABLE `item`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
    MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
