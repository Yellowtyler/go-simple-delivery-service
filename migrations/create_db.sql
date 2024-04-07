CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

drop table if exists orders_foods;
drop table if exists orders;
drop table if exists delivery;
drop table if exists foods;
drop table if exists users;
drop table if exists restaurants;

create table users (
    id uuid DEFAULT uuid_generate_v4(),
    name varchar not null unique,
    created_at timestamp not null,
    primary key(id)
);

create table restaurants (
    id uuid DEFAULT uuid_generate_v4(),
    name varchar not null,
    created_at timestamp not null,
    primary key(id)
);

create table foods (
    id uuid DEFAULT uuid_generate_v4(),
    name varchar not null,
    price int not null,
    restaurant_id uuid,
    created_at timestamp not null,
    primary key(id),
    constraint fk_restaurant
        foreign key (restaurant_id)
            references restaurants(id)
);

create table delivery (
    id uuid DEFAULT uuid_generate_v4(),
    name varchar not null,
    created_at timestamp not null,
    primary key (id)
);

create table orders (
    id uuid DEFAULT uuid_generate_v4(),
    price int not null,
    status int not null,
    restaurant_id uuid,
    delivery_id uuid,
    user_id uuid,
    created_at timestamp not null,
    primary key(id),
    constraint fk_delivery
        foreign key (delivery_id)
            references delivery(id),
    constraint fk_restaurant
        foreign key (restaurant_id)
            references restaurants(id),
    constraint fk_user
        foreign key (user_id)
            references users(id)
);

create table orders_foods (
    orders_id uuid references orders(id),
    foods_id uuid references foods(id),
    CONSTRAINT orders_foods_pkey PRIMARY KEY (orders_id, foods_id)
);

-- WITH new_author AS (
--     insert into authors (name, created_At)
--     values ('Lovecraft', current_timestamp) returning id
-- ) 
-- INSERT INTO books (name, genre, publication_date, created_at, author_id)
--     SELECT 'Шепчущий во тьме', 'Хоррор', '1920-10-02', current_timestamp, id
--         FROM new_author;
-- INSERT INTO books (name, genre, publication_date, created_at, author_id)
--     SELECT 'Зов Ктулху', 'Хоррор', '1921-10-02', current_timestamp, id
--         FROM authors where name = 'Lovecraft';
