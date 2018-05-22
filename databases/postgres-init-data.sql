drop table if exists customers cascade;
drop table if exists orders;
drop table if exists users;

create table users (
    id serial primary key,
    email varchar(128) not null,
    first_name varchar(128),
    last_name varchar(128),
    created_at timestamp not null default current_timestamp
);

create table customers (
    id serial primary key,
    first_name varchar(128),
    last_name varchar(128),
    email varchar(128) not null,
    street varchar(128),
    city varchar(128),
    zipcode varchar(128),
    created_at timestamp not null default current_timestamp
);

create table orders (
    id serial primary key,
    customer_id integer references customers not null,
    amount float not null,
    order_date date not null default current_date
);

INSERT INTO "users" ("email","first_name","last_name")
VALUES
('sam_wolfs@asist.be','Sam','Wolfs'),
('test@user.com','Test','User');

INSERT INTO "customers" ("first_name","last_name","email","street","city","zipcode")
VALUES
('Harmon','Crellin','Harmon_Crellin@gmail.com','Birchwood Drive 25','Volgorechensk',2020),
('Paulette', 'Terbeck','Paulette_Terbeck@gmail.com', 'Chinook Trail', 'Verberg', 9232),
('Rae','Olerenshaw','Rae_Olerenshaw@gmail.com','Londonderry Park 450','Biharamulo',4528),
('Tucker', 'Lowy','Tucker_Lowy@gmail.com', 'Lawn Place 6168', 'Cincinatti', 7800),
('Dunn', 'Scott','Dunn_Scott@gmail.com', 'Melby Circle 23', 'Vierzon', 9876),
('Rosene', 'Hotchkin','Rosene_Hotchkin@gmail.com', 'Tennessee Park 12', 'Shije', 5632),
('Faydra', 'Hammerich','Faydra_Hammerich@gmail.com', 'Summit Court 1', 'Mosteiro', 2222);

INSERT INTO "orders" ("customer_id", "amount", "order_date")
VALUES
(2, 120.2, date '2017-12-12'),
(2, 2002.00, date '2017-12-15'),
(3, 1123.23, date '2017-12-28'),
(4, 55.89, date '2018-01-02'),
(6, 1.98, date '2018-01-11'),
(1, 456.77, date '2018-01-22'),
(3, 89.02, date '2018-01-31'),
(5, 150.30, date '2018-02-20'),
(4, 121.90, date '2018-03-15'),
(5, 238.77, date '2018-03-22'),
(4, 5478.99, date '2018-04-01'),
(1, 150.22, date '2018-04-09'),
(3, 45.67, date '2018-04-23'),
(2, 953.45, date '2018-05-01'),
(1, 100.00, date '2018-05-14');
