drop table if exists mtm_employee_deal;
drop table if exists deal;
drop table if exists client;
drop table if exists property_dev;
drop table if exists employee;
drop table if exists position;
drop table if exists real_estate_object;
drop table if exists real_estate_building;
drop table if exists real_estate_complex;

create table real_estate_complex
(
    id serial,
    name varchar not null,
    type varchar not null,
    comfort_class varchar not null,
    constraint complex_id primary key (id),
    constraint complex_name_key unique (name)
);

create table real_estate_building
(
    id serial,
    address varchar not null,
    complex_id serial,
    floor_count smallint not null,
    constraint building_id primary key (id),
    foreign key (complex_id) references real_estate_complex (id) on delete cascade
);

create table real_estate_object
(
    id serial,
    building_id serial,
    local_address varchar not null,
    places smallint not null,
    price money not null,
    area int not null,
    floor smallint not null,
    type varchar not null,
    estate_type varchar not null,
    constraint object_id primary key (id),
    foreign key (building_id) references real_estate_building (id) on delete cascade
);

create table position
(
    id smallserial,
    name varchar not null,
    access_code smallint not null,
    constraint position_id primary key (id)
);

create table employee
(
    id serial,
    name varchar not null,
    specialization varchar not null,
    number char(12) not null,
    email varchar not null,
    login varchar not null,
    password varchar not null,
    senior_id serial,
    position_id smallserial,
    constraint employee_id primary key (id),
    constraint employee_email_key unique (email),
    constraint employee_number_key unique (number),
    constraint employee_login_key unique (login),
    foreign key (senior_id) references employee (id) on delete set null,
    foreign key (position_id) references position (id) on delete set null
);

create table property_dev
(
    id serial,
    name varchar not null,
    number char(12) not null,
    email varchar not null,
    constraint dev_key primary key (id),
    constraint dev_email_key unique (email),
    constraint dev_number_key unique (number)
);

create table client
(
    id serial,
    name varchar not null,
    status varchar not null default 'обычный',
    number char(12) not null,
    email varchar,
    constraint dev_key primary key (id),
    constraint dev_email_key unique (email),
    constraint dev_number_key unique (number)
);

create table deal
(
    id serial,
    real_estate_obj_id serial,
    property_dev_id serial,
    client_id serial,
    type varchar not null,
    status varchar not null,
    contract_number varchar not null,
    constraint deal_key primary key (id),
    foreign key (real_estate_obj_id) references real_estate_object (id) on delete cascade,
    foreign key (property_dev_id) references property_dev (id) on delete cascade,
    foreign key (client_id) references client (id) on delete cascade
);

create table mtm_employee_deal
(
    deal_id serial,
    client_id serial,
    constraint employee_deal_id primary key (deal_id),
    constraint deal_employee_id primary key (client_id),
    foreign key (deal_id) references deal (id) on delete cascade,
    foreign key (client_id) references client (id) on delete cascade
);