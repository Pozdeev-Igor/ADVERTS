create sequence hibernate_sequence start 2 increment 1;

create table advert (
    id int8 not null,
    filename varchar(255),
    title varchar(255),
    description varchar(2048) not null,
    user_id int8,
    category_id int8,
    sub_category_id int8,
    primary key (id)
);


create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table usr (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    phone_number varchar(255),
    primary key (id)
);


create table category (
    id int8 not null primary key,
    name varchar(255)

);

create table sub_category (
    id int8 not null primary key,
    name varchar(255),
    category_id int8
);

alter table if exists advert
    add constraint advert_user_fk
    foreign key (user_id) references usr,
    add constraint advert_sub_category_fk
    foreign key (sub_category_id) references sub_category,
    add constraint advert_category_fk
    foreign key (category_id) references category;

alter table if exists user_role
    add constraint user_role_user_fk
    foreign key (user_id) references usr;

alter table if exists sub_category
    add constraint sub_category_category
    foreign key (category_id) references category;
