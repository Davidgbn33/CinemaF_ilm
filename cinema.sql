DROP DATABASE cinema;

create database cinema;
       use cinema;

create table user
(
    id         int auto_increment
        primary key,
    firstname  varchar(50)  null,
    email      varchar(100) null,
    lastname   varchar(50)  null,
    birthday   date         null,
    password   varchar(100) null,
    role       varchar(50)  null,
    created_at timestamp    null,
    updated_at timestamp    null
);


create table booking
(
    id            int auto_increment
        primary key,
    nameBooking   varchar(100) null,
    numberPlace   int          null,
    seatNumber    int          null,
    created_at    timestamp    null,
    updated_at    timestamp    null,
    id_user       int          null,
    id_CinemaShow int          null,
    totalPrice    float        null
);



create table cinemashow
(
    id          int auto_increment
        primary key,
    startDate   datetime  null,
    endDate     datetime  null,
    seatAvaible int       null,
    price       float     null,
    id_room     int       null,
    id_movie    int       null,
    created_at  timestamp null,
    updated_at  timestamp null
);



create table discount_booking
(
    id_booking      int null,
    id_discountCard int null
);

create table discountcard
(
    id                  int auto_increment
        primary key,
    nameDiscount        varchar(100) null,
    descriptionDiscount text         null,
    pourcent            float        null,
    created_at          timestamp    null,
    updated_at          timestamp    null
);

create table item
(
    id    int unsigned auto_increment
        primary key,
    title varchar(255) not null
)
    engine = InnoDB
    charset = latin1;

create table movie
(
    id            int auto_increment
        primary key,
    title         varchar(150) null,
    description   text         null,
    duration      int          null,
    image         varchar(100) null,
    durationStart date         null,
    durationEnd   date         null,
    author        text         null,
    created_at    timestamp    null,
    updated_at    timestamp    null
);

create table room
(
    id         int auto_increment
        primary key,
    seatNumber int       null,
    seatRank   int       null,
    seatline   int       null,
    created_at timestamp null,
    updated_at timestamp null
);

create index id_film
    on cinemashow (id_movie);

create index id_room
    on cinemashow (id_room);

create index id_CinemaShow
    on booking (id_CinemaShow);

create index id_user
    on booking (id_user);


INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (1, 'Florian', 4, null, null, null, 1, 3, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (2, 'Florian', 4, null, '2023-10-19 12:10:24', '2023-10-19 12:10:24', 1, 3, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (3, 'Florian', 4, null, '2023-10-19 12:26:20', '2023-10-19 12:26:20', 1, 3, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (4, 'Florian', 4, null, '2023-10-19 14:55:46', '2023-10-19 14:55:46', 1, 1, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (5, 'Florian', 3, null, '2023-10-19 14:56:48', '2023-10-19 14:56:48', 1, 1, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (6, 'Florian', 3, null, '2023-10-19 15:00:41', '2023-10-19 15:00:41', 1, 1, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (7, 'Florian', 3, null, '2023-10-19 15:06:06', '2023-10-19 15:06:06', 1, 1, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (8, 'Florian', 3, null, '2023-10-19 15:17:03', '2023-10-19 15:17:03', 1, 1, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (9, 'Florian', 3, null, '2023-10-19 15:17:31', '2023-10-19 15:17:31', 1, 5, null);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (10, 'Florian', 3, null, '2023-10-19 15:22:04', '2023-10-19 15:22:04', 1, 5, 22);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (11, 'Florian', 3, null, '2023-10-19 15:22:41', '2023-10-19 15:22:41', 1, 5, 22);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (12, 'Florian', 3, null, '2023-10-19 15:23:37', '2023-10-19 15:23:37', 1, 5, 22);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (13, 'Florian', 3, null, '2023-10-19 15:23:59', '2023-10-19 15:23:59', 1, 5, 22);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (14, 'Florian', 0, null, '2023-10-20 12:20:06', '2023-10-20 12:20:06', 1, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (15, 'flo', 0, null, '2023-10-20 12:31:07', '2023-10-20 12:31:07', 1, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (16, 'flo', 0, null, '2023-10-20 12:31:48', '2023-10-20 12:31:48', 1, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (17, 'flo', 0, null, '2023-10-20 12:35:08', '2023-10-20 12:35:08', 1, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (18, 'flo', 0, null, '2023-10-20 12:36:42', '2023-10-20 12:36:42', 1, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (19, 'flo', 0, null, '2023-10-20 12:37:21', '2023-10-20 12:37:21', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (20, 'test', 0, null, '2023-10-20 12:37:59', '2023-10-20 12:37:59', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (21, 'test', 0, null, '2023-10-20 12:42:09', '2023-10-20 12:42:09', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (22, 'test', 0, null, '2023-10-20 12:43:09', '2023-10-20 12:43:09', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (23, 'test', 0, null, '2023-10-20 12:45:00', '2023-10-20 12:45:00', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (24, 'test', 0, null, '2023-10-20 12:45:50', '2023-10-20 12:45:50', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (25, 'test', 0, null, '2023-10-20 12:46:50', '2023-10-20 12:46:50', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (26, 'test', 0, null, '2023-10-20 13:44:04', '2023-10-20 13:44:04', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (27, 'test', 0, null, '2023-10-20 13:46:56', '2023-10-20 13:46:56', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (28, 'test', 0, null, '2023-10-20 13:49:29', '2023-10-20 13:49:29', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (29, 'test', 0, null, '2023-10-20 13:52:23', '2023-10-20 13:52:23', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (30, 'test', 0, null, '2023-10-20 14:02:55', '2023-10-20 14:02:55', 6, 5, 0);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (31, 'test', 2, null, '2023-10-20 14:05:21', '2023-10-20 14:05:21', 6, 1, 20);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (32, 'test', 2, null, '2023-10-20 14:05:44', '2023-10-20 14:05:44', 6, 1, 20);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (33, 'test', 2, null, '2023-10-20 14:07:20', '2023-10-20 14:07:20', 6, 1, 20);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (34, 'test', 3, null, '2023-10-20 14:07:38', '2023-10-20 14:07:38', 6, 3, 22);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (35, 'test', 11, null, '2023-10-20 14:08:40', '2023-10-20 14:08:40', 6, 1, 88);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (36, 'test', 8, null, '2023-10-20 14:08:52', '2023-10-20 14:08:52', 6, 1, 40);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (37, 'test', 9, null, '2023-10-20 14:09:02', '2023-10-20 14:09:02', 6, 1, 90);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (38, 'test', 11, null, '2023-10-20 14:09:11', '2023-10-20 14:09:11', 6, 1, 77);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (39, 'test', 7, null, '2023-10-20 14:09:24', '2023-10-20 14:09:24', 6, 1, 50);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (40, 'test', 12, null, '2023-10-20 14:09:36', '2023-10-20 14:09:36', 6, 5, 85);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (41, 'test', 41, null, '2023-10-20 14:14:15', '2023-10-20 14:14:15', 6, 1, 262);
INSERT INTO cinema.booking (id, nameBooking, numberPlace, seatNumber, created_at, updated_at, id_user, id_CinemaShow, totalPrice) VALUES (42, 'test', 41, null, '2023-10-20 14:15:05', '2023-10-20 14:15:05', 6, 1, 262);

INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (1, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 1, 1, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (2, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 1, 1, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (3, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 1, 1, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (4, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 1, 1, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (5, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 1, 1, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (6, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 2, 2, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (7, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 2, 2, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (8, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 2, 2, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (9, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 2, 2, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (10, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 2, 2, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (11, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 3, 3, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (12, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 3, 3, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (13, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 3, 3, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (14, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 3, 3, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (15, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 3, 3, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (16, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 4, 4, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (17, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 4, 4, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (18, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 4, 4, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (19, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 4, 4, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (20, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 4, 4, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (21, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 5, 5, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (22, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 5, 5, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (23, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 5, 5, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (24, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 5, 5, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (25, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 5, 5, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (26, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 6, 6, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (27, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 6, 6, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (28, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 6, 6, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (29, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 6, 6, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (30, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 6, 6, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (31, '2008-10-18 08:00:00', '2012-10-18 10:45:00', 300, 10, 7, 7, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (32, '2023-10-18 11:00:00', '2023-10-18 13:45:00', 300, 10, 7, 7, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (33, '2023-10-18 14:00:00', '2023-10-18 16:45:00', 300, 10, 7, 7, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (34, '2023-10-18 17:00:00', '2023-10-18 19:45:00', 300, 10, 7, 7, null, null);
INSERT INTO cinema.cinemashow (id, startDate, endDate, seatAvaible, price, id_room, id_movie, created_at, updated_at) VALUES (35, '2023-10-18 20:00:00', '2023-10-18 23:00:00', 300, 10, 7, 7, null, null);


INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (1, 'Oscar et le monde des chats', 'Oscar est un chaton qui vit paisiblement avec son père Léon, un gros chat d/’appartement. Rêveur, il croit en l/’existence de Catstopia, un monde merveilleux où vivent les chats. Il décide un jour de partir à l/’aventure !', 87, '2779101.jpg', '2023-10-18', '2023-11-01', 'Jean-Michel Vovk, Charlie Langendries, Ioanna Gkizas , Franck Dacquin', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (2, 'Astérix - Le Secret de la Potion Magique', 'À la suite d’une chute lors de la cueillette du gui, le druide Panoramix décide qu’il est temps d’assurer l’avenir du village. Accompagné d’Astérix et Obélix, il entreprend de parcourir le monde gaulois à la recherche d’un jeune druide talentueux à qui transmettre le Secret de la Potion Magique…', 95, '1793011.jpg', '2023-10-18', '2023-11-01', 'Christian Clavier, Guillaume Briat, Daniel Mesguich, Alexandre Astier, Elie Semoun', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (3, 'Le Gendre de ma vie', 'Stéphane et Suzanne sont parents de trois jeunes femmes, le tableau peut sembler idéal mais Stéphane n’a jamais eu de fils et a toujours rêvé d’en avoir. Pour combler cette frustration, il s’accapare ses gendres et en tombe plus vite amoureux que ses filles.', 117, '3261460.jpg', '2023-10-18', '2023-11-01', 'Kad Merad, Pauline Etienne, Julie Gayet, François Deblock, Zabou Breitman', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (4, 'Rémi sans famille', 'Les aventures du jeune Rémi, orphelin recueilli par la douce Madame Barberin. A l’âge de 10 ans, il est arraché à sa mère adoptive et confié au Signor Vitalis, un mystérieux musicien ambulant. A ses côtés, il va apprendre la rude vie de saltimbanque et à chanter pour gagner son pain.', 109, '5560173.jpg', '2023-10-18', '2023-11-01', 'Daniel Auteuil, Virginie Ledoyen, Ludivine Sagnier, Jonathan Zaccaï, Jacques Perrin', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (5, 'Le Retour de Mary Poppins', 'Michael et Jane sont désormais adultes. Michael vit sur Cherry Tree Lane avec ses trois enfants et leur gouvernante, Ellen. Lorsque celui-ci perd un proche, Mary Poppins, l’énigmatique nounou, réapparaît dans la vie de la famille Banks.', 124, '3191210.jpg', '2023-10-18', '2023-11-01', 'Emily Blunt, Lin-Manuel Miranda, Ben Whishaw, Emily Mortimer, Pixie Davies', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (6, 'Pachamama', 'Tepulpaï et Naïra, deux petits indiens de la Cordillère des Andes, partent à la poursuite de la Huaca, totem protecteur de leur village, confisqué par les Incas. Leur quête les mènera jusqu’à Cuzco, capitale royale assiégée par les conquistadors.', 72, '5452144.jpg', '2023-10-18', '2023-11-01', 'Andrea Santamaria, India Coenen, Saïd Amadis, Marie-Christine Darah, Vincent Ropion', '2023-10-17 00:00:00', null);
INSERT INTO cinema.movie (id, title, description, duration, image, durationStart, durationEnd, author, created_at, updated_at) VALUES (7, 'Mia et le Lion Blanc', 'Mia a 11 ans quand elle noue une relation hors du commun avec Charlie, un lionceau blanc né dans la ferme d\'élevage de félins de ses parents en Afrique du Sud. Pendant trois ans, ils vont grandir ensemble et vivre une amitié fusionnelle. Quand Mia atteint l\'âge de 14 ans elle découvre l’insoutenable vérité : son père a décidé de le vendre à des chasseurs de trophées. ', 98, '3360862.jpg', '2023-10-18', '2023-11-01', 'Daniah De Villiers, Mélanie Laurent, Langley Kirkwood, Ryan Mac Lennan, Lionel Newton', '2023-10-17 00:00:00', null);


INSERT INTO cinema.discountcard (id, nameDiscount, descriptionDiscount, pourcent, created_at, updated_at) VALUES (1, '-14', 'pour les enfants de moins de 14ans', 50, '2023-10-19 13:58:55', '2023-10-19 13:58:55');
INSERT INTO cinema.discountcard (id, nameDiscount, descriptionDiscount, pourcent, created_at, updated_at) VALUES (2, '-26', 'pour les adultes de moins de 26ans', 25, '2023-10-19 14:00:56', '2023-10-19 14:00:56');
INSERT INTO cinema.discountcard (id, nameDiscount, descriptionDiscount, pourcent, created_at, updated_at) VALUES (3, 'Normal', 'pour tous', 0, '2023-10-19 14:01:23', '2023-10-19 14:01:23');

INSERT INTO cinema.item (id, title) VALUES (1, 'Stuff');
INSERT INTO cinema.item (id, title) VALUES (2, 'Doodads');

INSERT INTO cinema.user (id, firstname, email, lastname, birthday, password, role, created_at, updated_at) VALUES (5, 'test', 'flo@hot.com', 'test', '2023-10-04', '$2y$10$ANDJMUrEBv2d5sfbLMijM.LfuDdOAoIpG4KF4sQcar5ZC4Y6CLACy', 'admin', null, null);
INSERT INTO cinema.user (id, firstname, email, lastname, birthday, password, role, created_at, updated_at) VALUES (2, 'David', 'Gibon', 'Dgib@yahoo.com', '1980-12-24', '123456', 'admin', '2023-10-20 10:20:51', '2023-10-20 10:20:51');
INSERT INTO cinema.user (id, firstname, email, lastname, birthday, password, role, created_at, updated_at) VALUES (3, 'Jerome', 'DeTro', 'Dje@yahoo.com', '1980-12-24', '123456', 'admin', '2023-10-20 10:21:32', '2023-10-20 10:21:32');
INSERT INTO cinema.user (id, firstname, email, lastname, birthday, password, role, created_at, updated_at) VALUES (6, 'test', 'test@me.fr', 'test', '2001-10-10', '$2y$10$WNEPGhZYtufrHAxXjOepW.Hsxm1ZX9UQ49hOgpH14CWaX4NIP0lBS', 'user', null, null);
INSERT INTO cinema.user (id, firstname, email, lastname, birthday, password, role, created_at, updated_at) VALUES (7, 'admin', 'admin@me.fr', 'admin', '1980-12-31', '$2y$10$VDfyGyXfd76hnssqyJX6a.g/o6VzlF1P2eO/ckzsmPHOf.itEmV2C', 'admin', null, null);

INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (1, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (2, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (3, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (4, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (5, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (6, 300, 6, 50, null, null);
INSERT INTO cinema.room (id, seatNumber, seatRank, seatline, created_at, updated_at) VALUES (7, 300, 6, 50, null, null);

