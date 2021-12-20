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
    complex_id int,
    floor_count smallint not null,
    constraint building_id primary key (id),
    foreign key (complex_id) references real_estate_complex (id) on delete cascade
);

create table real_estate_object
(
    id serial,
    building_id int not null,
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
    id serial,
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
    senior_id int,
    position_id int,
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
    constraint client_key primary key (id),
    constraint client_email_key unique (email),
    constraint client_number_key unique (number)
);

create table deal
(
    id serial,
    real_estate_obj_id int not null,
    property_dev_id int not null,
    client_id int not null,
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
    deal_id int not null,
    employee_id int not null,
    constraint employee_deal_id primary key (deal_id, employee_id),
    foreign key (deal_id) references deal (id) on delete cascade,
    foreign key (employee_id) references client (id) on delete cascade
);

insert into position (name, access_code)
values
    ('Генеральный директор', 5),
    ('Руководитель отдела', 5),
    ('Заместитель руководителя', 5),
    ('Технический специалист', 5),
    ('HR', 1),
    ('Младший брокер', 3),
    ('Брокер', 4),
    ('Старший брокер', 4)
;

insert into employee (id, name, specialization, number, email, login, password)
values (1, 'Шульц Геннадий Викторович', 'Жилая недвижимость', 79299901005, 'ShulcGennadiyViktorovich-1@agency.ru', 'GeViSh-129', 'ennaiktohulc189'),
       (2, 'Шульц Дмитрий Владимирович', 'Жилая недвижимость', 79290394316, 'ShulcDmitriyVladimirovich-2@agency.ru', 'DmVlSh-225', 'mitrladihulc268'),
       (3, 'Егоров Василий Ильич', 'Жилая недвижимость', 79298963522, 'EgorovVasiliyIlich-3@agency.ru', 'VaIlEg-360', 'asillichgoro343'),
       (4, 'Таманский Евгений Вадимович', 'Коммерческая недвижимость', 79290849839, 'TamanskiyEvgeniyVadimovich-4@agency.ru', 'EvVaTa-481', 'vgenadimaman486'),
       (5, 'Таманский Геннадий Леонидович', 'Коммерческая недвижимость', 79299180228, 'TamanskiyGennadiyLeonidovich-5@agency.ru', 'GeLeTa-512', 'ennaeoniaman535'),
       (6, 'Романов Эдуард Викторович', 'Жилая недвижимость', 79294140638, 'RomanovEduardViktorovich-6@agency.ru', 'EdViRo-695', 'duariktooman613'),
       (7, 'Акимов Иван Леонидович', 'Коммерческая недвижимость', 79290355690, 'AkimovIvanLeonidovich-7@agency.ru', 'IvLeAk-729', 'vaneonikimo760'),
       (8, 'Васнецов Евгений Олегович', 'Жилая недвижимость', 79297577549, 'VasnecovEvgeniyOlegovich-8@agency.ru', 'EvOlVa-885', 'vgenlegoasne866'),
       (9, 'Иванов Александр Олегович', 'Коммерческая недвижимость', 79298699306, 'IvanovAleksandrOlegovich-9@agency.ru', 'AlOlIv-962', 'lekslegovano980'),
       (10, 'Кузнецов Вадим Ильич', 'Коммерческая недвижимость', 79293341672, 'KuznecovVadimIlich-10@agency.ru', 'VaIlKu-1039', 'adimlichuzne1012'),
       (11, 'Егоров Дмитрий Арсеньевич', 'Жилая недвижимость', 79293829936, 'EgorovDmitriyArsenevich-11@agency.ru', 'DmArEg-1120', 'mitrrsengoro1116'),
       (12, 'Круглов Владимир Викторович', 'Жилая недвижимость', 79299506475, 'KruglovVladimirViktorovich-12@agency.ru', 'VlViKr-1271', 'ladiiktorugl1279'),
       (13, 'Антипов Виктор Артёмович', 'Жилая недвижимость', 79292392510, 'AntipovViktorArtemovich-13@agency.ru', 'ViArAn-1389', 'iktortemntip1364'),
       (14, 'Антипов Юрий Олегович', 'Коммерческая недвижимость', 79298871242, 'AntipovYuriyOlegovich-14@agency.ru', 'YuOlAn-1410', 'uriylegontip1422'),
       (15, 'Игнатьев Евгений Антонович', 'Жилая недвижимость', 79297942777, 'IgnatevEvgeniyAntonovich-15@agency.ru', 'EvAnIg-1529', 'vgenntongnat1541'),
       (16, 'Акимов Артём Дмитриевич', 'Жилая недвижимость', 79291115630, 'AkimovArtemDmitrievich-16@agency.ru', 'ArDmAk-1676', 'rtemmitrkimo1693'),
       (17, 'Антипов Арсений Вадимович', 'Жилая недвижимость', 79299000297, 'AntipovArseniyVadimovich-17@agency.ru', 'ArVaAn-1759', 'rsenadimntip1740'),
       (18, 'Высоцкий Александр Артёмович', 'Коммерческая недвижимость', 79295015355, 'VysockiyAleksandrArtemovich-18@agency.ru', 'AlArVy-1830', 'leksrtemysoc1813'),
       (19, 'Антипов Вадим Геннадьевич', 'Коммерческая недвижимость', 79294149803, 'AntipovVadimGennadevich-19@agency.ru', 'VaGeAn-1943', 'adimennantip1997'),
       (20, 'Антипов Виктор Юрьевич', 'Жилая недвижимость', 79292604782, 'AntipovViktorYurevich-20@agency.ru', 'ViYuAn-2094', 'iktourevntip2012'),
       (21, 'Егоров Арсений Викторович', 'Жилая недвижимость', 79297942821, 'EgorovArseniyViktorovich-21@agency.ru', 'ArViEg-2114', 'rseniktogoro2189'),
       (22, 'Кузнецов Евгений Вадимович', 'Жилая недвижимость', 79297262467, 'KuznecovEvgeniyVadimovich-22@agency.ru', 'EvVaKu-2270', 'vgenadimuzne2276'),
       (23, 'Таманский Юрий Викторович', 'Жилая недвижимость', 79292857426, 'TamanskiyYuriyViktorovich-23@agency.ru', 'YuViTa-2395', 'uriyiktoaman2323'),
       (24, 'Петров Иван Артёмович', 'Коммерческая недвижимость', 79295652590, 'PetrovIvanArtemovich-24@agency.ru', 'IvArPe-2496', 'vanrtemetro2490'),
       (25, 'Петров Виктор Владимирович', 'Коммерческая недвижимость', 79299475958, 'PetrovViktorVladimirovich-25@agency.ru', 'ViVlPe-2534', 'iktoladietro2559'),
       (26, 'Антипов Иван Викторович', 'Коммерческая недвижимость', 79294663134, 'AntipovIvanViktorovich-26@agency.ru', 'IvViAn-2658', 'vaniktontip2682'),
       (27, 'Акимов Леонид Эдуардович', 'Жилая недвижимость', 79298007518, 'AkimovLeonidEduardovich-27@agency.ru', 'LeEdAk-2767', 'eoniduarkimo2772'),
       (28, 'Романов Илья Юрьевич', 'Жилая недвижимость', 79294694449, 'RomanovIlyaYurevich-28@agency.ru', 'IlYuRo-2828', 'lyaurevoman2861'),
       (29, 'Игнатьев Дмитрий Леонидович', 'Жилая недвижимость', 79298419871, 'IgnatevDmitriyLeonidovich-29@agency.ru', 'DmLeIg-2961', 'mitreonignat2993'),
       (30, 'Игнатьев Илья Леонидович', 'Коммерческая недвижимость', 79294449896, 'IgnatevIlyaLeonidovich-30@agency.ru', 'IlLeIg-3046', 'lyaeonignat3063'),
       (31, 'Солдатов Василий Геннадьевич', 'Жилая недвижимость', 79298392024, 'SoldatovVasiliyGennadevich-31@agency.ru', 'VaGeSo-3174', 'asilennaolda3181'),
       (32, 'Кузнецов Олег Артёмович', 'Жилая недвижимость', 79291651690, 'KuznecovOlegArtemovich-32@agency.ru', 'OlArKu-3231', 'legrtemuzne3299'),
       (33, 'Шульц Владимир Владимирович', 'Коммерческая недвижимость', 79297675087, 'ShulcVladimirVladimirovich-33@agency.ru', 'VlVlSh-3325', 'ladiladihulc3368'),
       (34, 'Игнатьев Евгений Юрьевич', 'Коммерческая недвижимость', 79293728277, 'IgnatevEvgeniyYurevich-34@agency.ru', 'EvYuIg-3488', 'vgenurevgnat3421'),
       (35, 'Солдатов Виктор Васильевич', 'Жилая недвижимость', 79299801300, 'SoldatovViktorVasilevich-35@agency.ru', 'ViVaSo-3538', 'iktoasilolda3544'),
       (36, 'Антипов Виктор Дмитриевич', 'Жилая недвижимость', 79293246459, 'AntipovViktorDmitrievich-36@agency.ru', 'ViDmAn-3646', 'iktomitrntip3642'),
       (37, 'Ерёмин Юрий Дмитриевич', 'Жилая недвижимость', 79293858525, 'EreminYuriyDmitrievich-37@agency.ru', 'YuDmEr-3714', 'uriymitrremi3723'),
       (38, 'Петров Вадим Геннадьевич', 'Коммерческая недвижимость', 79299916504, 'PetrovVadimGennadevich-38@agency.ru', 'VaGePe-3882', 'adimennaetro3886'),
       (39, 'Кузнецов Вадим Юрьевич', 'Коммерческая недвижимость', 79294588270, 'KuznecovVadimYurevich-39@agency.ru', 'VaYuKu-3953', 'adimurevuzne3951'),
       (40, 'Романов Владимир Геннадьевич', 'Коммерческая недвижимость', 79292260909, 'RomanovVladimirGennadevich-40@agency.ru', 'VlGeRo-4058', 'ladiennaoman4039'),
       (41, 'Васильев Евгений Антонович', 'Жилая недвижимость', 79293449795, 'VasilevEvgeniyAntonovich-41@agency.ru', 'EvAnVa-4164', 'vgenntonasil4189'),
       (42, 'Баранов Евгений Артёмович', 'Жилая недвижимость', 79293373140, 'BaranovEvgeniyArtemovich-42@agency.ru', 'EvArBa-4249', 'vgenrtemaran4272'),
       (43, 'Баранов Вадим Васильевич', 'Коммерческая недвижимость', 79299260474, 'BaranovVadimVasilevich-43@agency.ru', 'VaVaBa-4340', 'adimasilaran4351'),
       (44, 'Ерёмин Илья Евгеньевич', 'Коммерческая недвижимость', 79296576621, 'EreminIlyaEvgenevich-44@agency.ru', 'IlEvEr-4418', 'lyavgenremi4471'),
       (45, 'Таманский Евгений Владимирович', 'Коммерческая недвижимость', 79292697900, 'TamanskiyEvgeniyVladimirovich-45@agency.ru', 'EvVlTa-4591', 'vgenladiaman4517'),
       (46, 'Шульц Василий Арсеньевич', 'Жилая недвижимость', 79292743453, 'ShulcVasiliyArsenevich-46@agency.ru', 'VaArSh-4612', 'asilrsenhulc4672'),
       (47, 'Романов Владимир Артёмович', 'Коммерческая недвижимость', 79298780197, 'RomanovVladimirArtemovich-47@agency.ru', 'VlArRo-4724', 'ladirtemoman4748'),
       (48, 'Круглов Василий Геннадьевич', 'Жилая недвижимость', 79297175580, 'KruglovVasiliyGennadevich-48@agency.ru', 'VaGeKr-4889', 'asilennarugl4881'),
       (49, 'Баранов Виктор Вадимович', 'Коммерческая недвижимость', 79290684074, 'BaranovViktorVadimovich-49@agency.ru', 'ViVaBa-4913', 'iktoadimaran4989'),
       (50, 'Петров Владимир Геннадьевич', 'Коммерческая недвижимость', 79299527439, 'PetrovVladimirGennadevich-50@agency.ru', 'VlGePe-5074', 'ladiennaetro5040'),
       (51, 'Шульц Дмитрий Викторович', 'Коммерческая недвижимость', 79298782341, 'ShulcDmitriyViktorovich-51@agency.ru', 'DmViSh-5121', 'mitriktohulc5165'),
       (52, 'Баранов Вадим Петрович', 'Коммерческая недвижимость', 79294824974, 'BaranovVadimPetrovich-52@agency.ru', 'VaPeBa-5294', 'adimetroaran5251'),
       (53, 'Игнатьев Александр Петрович', 'Жилая недвижимость', 79298932213, 'IgnatevAleksandrPetrovich-53@agency.ru', 'AlPeIg-5316', 'leksetrognat5327'),
       (54, 'Антипов Вадим Ильич', 'Коммерческая недвижимость', 79299018109, 'AntipovVadimIlich-54@agency.ru', 'VaIlAn-5455', 'adimlichntip5448'),
       (55, 'Таманский Дмитрий Антонович', 'Жилая недвижимость', 79293991084, 'TamanskiyDmitriyAntonovich-55@agency.ru', 'DmAnTa-5528', 'mitrntonaman5597'),
       (56, 'Иванов Евгений Вадимович', 'Коммерческая недвижимость', 79295808517, 'IvanovEvgeniyVadimovich-56@agency.ru', 'EvVaIv-5621', 'vgenadimvano5646'),
       (57, 'Солдатов Илья Эдуардович', 'Коммерческая недвижимость', 79293295663, 'SoldatovIlyaEduardovich-57@agency.ru', 'IlEdSo-5710', 'lyaduarolda5786'),
       (58, 'Петров Владимир Викторович', 'Жилая недвижимость', 79298223813, 'PetrovVladimirViktorovich-58@agency.ru', 'VlViPe-5838', 'ladiiktoetro5889'),
       (59, 'Егоров Юрий Ильич', 'Коммерческая недвижимость', 79291378694, 'EgorovYuriyIlich-59@agency.ru', 'YuIlEg-5941', 'uriylichgoro5928'),
       (60, 'Егоров Иван Эдуардович', 'Коммерческая недвижимость', 79298442606, 'EgorovIvanEduardovich-60@agency.ru', 'IvEdEg-6080', 'vanduargoro6017'),
       (61, 'Игнатьев Пётр Олегович', 'Жилая недвижимость', 79293655533, 'IgnatevPetrOlegovich-61@agency.ru', 'PeOlIg-6116', 'etrlegognat6156'),
       (62, 'Ерёмин Олег Владимирович', 'Коммерческая недвижимость', 79291753552, 'EreminOlegVladimirovich-62@agency.ru', 'OlVlEr-6273', 'legladiremi6238'),
       (63, 'Егоров Геннадий Владимирович', 'Жилая недвижимость', 79299664387, 'EgorovGennadiyVladimirovich-63@agency.ru', 'GeVlEg-6350', 'ennaladigoro6367'),
       (64, 'Шульц Арсений Олегович', 'Коммерческая недвижимость', 79299569893, 'ShulcArseniyOlegovich-64@agency.ru', 'ArOlSh-6475', 'rsenlegohulc6459'),
       (65, 'Солдатов Геннадий Александрович', 'Жилая недвижимость', 79297180063, 'SoldatovGennadiyAleksandrovich-65@agency.ru', 'GeAlSo-6529', 'ennaleksolda6551'),
       (66, 'Высоцкий Василий Арсеньевич', 'Жилая недвижимость', 79293165694, 'VysockiyVasiliyArsenevich-66@agency.ru', 'VaArVy-6641', 'asilrsenysoc6659'),
       (67, 'Петров Артём Артёмович', 'Коммерческая недвижимость', 79297853827, 'PetrovArtemArtemovich-67@agency.ru', 'ArArPe-6763', 'rtemrtemetro6762'),
       (68, 'Антипов Эдуард Вадимович', 'Коммерческая недвижимость', 79296206102, 'AntipovEduardVadimovich-68@agency.ru', 'EdVaAn-6880', 'duaradimntip6831'),
       (69, 'Баранов Олег Вадимович', 'Жилая недвижимость', 79296454129, 'BaranovOlegVadimovich-69@agency.ru', 'OlVaBa-6992', 'legadimaran6998'),
       (70, 'Солдатов Владимир Леонидович', 'Коммерческая недвижимость', 79290171844, 'SoldatovVladimirLeonidovich-70@agency.ru', 'VlLeSo-7047', 'ladieoniolda7055'),
       (71, 'Васильев Геннадий Олегович', 'Коммерческая недвижимость', 79298604059, 'VasilevGennadiyOlegovich-71@agency.ru', 'GeOlVa-7142', 'ennalegoasil7137'),
       (72, 'Иванов Леонид Петрович', 'Коммерческая недвижимость', 79295740929, 'IvanovLeonidPetrovich-72@agency.ru', 'LePeIv-7259', 'eonietrovano7247'),
       (73, 'Круглов Артём Вадимович', 'Жилая недвижимость', 79295644859, 'KruglovArtemVadimovich-73@agency.ru', 'ArVaKr-7342', 'rtemadimrugl7348'),
       (74, 'Солдатов Эдуард Дмитриевич', 'Коммерческая недвижимость', 79297420997, 'SoldatovEduardDmitrievich-74@agency.ru', 'EdDmSo-7439', 'duarmitrolda7467'),
       (75, 'Антипов Арсений Иванович', 'Жилая недвижимость', 79296824764, 'AntipovArseniyIvanovich-75@agency.ru', 'ArIvAn-7510', 'rsenvanontip7597'),
       (76, 'Солдатов Леонид Владимирович', 'Коммерческая недвижимость', 79295248959, 'SoldatovLeonidVladimirovich-76@agency.ru', 'LeVlSo-7627', 'eoniladiolda7691'),
       (77, 'Васнецов Евгений Ильич', 'Коммерческая недвижимость', 79294741318, 'VasnecovEvgeniyIlich-77@agency.ru', 'EvIlVa-7743', 'vgenlichasne7742'),
       (78, 'Таманский Евгений Эдуардович', 'Коммерческая недвижимость', 79295286545, 'TamanskiyEvgeniyEduardovich-78@agency.ru', 'EvEdTa-7831', 'vgenduaraman7888'),
       (79, 'Новиков Дмитрий Олегович', 'Коммерческая недвижимость', 79296693571, 'NovikovDmitriyOlegovich-79@agency.ru', 'DmOlNo-7971', 'mitrlegoovik7942'),
       (80, 'Антипов Виктор Леонидович', 'Коммерческая недвижимость', 79297819665, 'AntipovViktorLeonidovich-80@agency.ru', 'ViLeAn-8025', 'iktoeonintip8052'),
       (81, 'Васильев Василий Ильич', 'Коммерческая недвижимость', 79292197302, 'VasilevVasiliyIlich-81@agency.ru', 'VaIlVa-8148', 'asillichasil8171'),
       (82, 'Акимов Пётр Арсеньевич', 'Коммерческая недвижимость', 79290698159, 'AkimovPetrArsenevich-82@agency.ru', 'PeArAk-8256', 'etrrsenkimo8279'),
       (83, 'Егоров Юрий Владимирович', 'Жилая недвижимость', 79298789821, 'EgorovYuriyVladimirovich-83@agency.ru', 'YuVlEg-8348', 'uriyladigoro8322'),
       (84, 'Новиков Эдуард Ильич', 'Жилая недвижимость', 79295643119, 'NovikovEduardIlich-84@agency.ru', 'EdIlNo-8486', 'duarlichovik8486'),
       (85, 'Васильев Александр Эдуардович', 'Жилая недвижимость', 79295037003, 'VasilevAleksandrEduardovich-85@agency.ru', 'AlEdVa-8544', 'leksduarasil8544'),
       (86, 'Акимов Владимир Владимирович', 'Коммерческая недвижимость', 79293246535, 'AkimovVladimirVladimirovich-86@agency.ru', 'VlVlAk-8638', 'ladiladikimo8665'),
       (87, 'Романов Владимир Ильич', 'Коммерческая недвижимость', 79297263873, 'RomanovVladimirIlich-87@agency.ru', 'VlIlRo-8764', 'ladilichoman8753'),
       (88, 'Ерёмин Эдуард Геннадьевич', 'Коммерческая недвижимость', 79295714825, 'EreminEduardGennadevich-88@agency.ru', 'EdGeEr-8820', 'duarennaremi8829'),
       (89, 'Новиков Арсений Петрович', 'Жилая недвижимость', 79293552856, 'NovikovArseniyPetrovich-89@agency.ru', 'ArPeNo-8937', 'rsenetroovik8912'),
       (90, 'Кузнецов Эдуард Геннадьевич', 'Коммерческая недвижимость', 79291350465, 'KuznecovEduardGennadevich-90@agency.ru', 'EdGeKu-9052', 'duarennauzne9047'),
       (91, 'Круглов Александр Евгеньевич', 'Жилая недвижимость', 79293857517, 'KruglovAleksandrEvgenevich-91@agency.ru', 'AlEvKr-9133', 'leksvgenrugl9157'),
       (92, 'Таманский Дмитрий Артёмович', 'Жилая недвижимость', 79297502515, 'TamanskiyDmitriyArtemovich-92@agency.ru', 'DmArTa-9246', 'mitrrtemaman9285'),
       (93, 'Круглов Пётр Евгеньевич', 'Жилая недвижимость', 79299210161, 'KruglovPetrEvgenevich-93@agency.ru', 'PeEvKr-9394', 'etrvgenrugl9366'),
       (94, 'Иванов Геннадий Александрович', 'Коммерческая недвижимость', 79298573033, 'IvanovGennadiyAleksandrovich-94@agency.ru', 'GeAlIv-9456', 'ennaleksvano9429'),
       (95, 'Баранов Владимир Викторович', 'Жилая недвижимость', 79294912562, 'BaranovVladimirViktorovich-95@agency.ru', 'VlViBa-9546', 'ladiiktoaran9524'),
       (96, 'Новиков Юрий Юрьевич', 'Жилая недвижимость', 79297212699, 'NovikovYuriyYurevich-96@agency.ru', 'YuYuNo-9647', 'uriyurevovik9649'),
       (97, 'Новиков Геннадий Владимирович', 'Коммерческая недвижимость', 79298601164, 'NovikovGennadiyVladimirovich-97@agency.ru', 'GeVlNo-9742', 'ennaladiovik9752'),
       (98, 'Антипов Антон Юрьевич', 'Коммерческая недвижимость', 79293954373, 'AntipovAntonYurevich-98@agency.ru', 'AnYuAn-9867', 'ntonurevntip9885'),
       (99, 'Таманский Эдуард Эдуардович', 'Жилая недвижимость', 79291746257, 'TamanskiyEduardEduardovich-99@agency.ru', 'EdEdTa-9926', 'duarduaraman9921'),
       (100, 'Кузнецов Илья Юрьевич', 'Жилая недвижимость', 79291605798, 'KuznecovIlyaYurevich-100@agency.ru', 'IlYuKu-10028', 'lyaurevuzne10039'),
       (101, 'Игнатьев Леонид Ильич', 'Коммерческая недвижимость', 79295734360, 'IgnatevLeonidIlich-101@agency.ru', 'LeIlIg-10173', 'eonilichgnat10197'),
       (102, 'Васильев Эдуард Васильевич', 'Коммерческая недвижимость', 79297717970, 'VasilevEduardVasilevich-102@agency.ru', 'EdVaVa-10230', 'duarasilasil10272'),
       (103, 'Круглов Иван Артёмович', 'Коммерческая недвижимость', 79298558823, 'KruglovIvanArtemovich-103@agency.ru', 'IvArKr-10334', 'vanrtemrugl10313'),
       (104, 'Новиков Виктор Эдуардович', 'Коммерческая недвижимость', 79298600904, 'NovikovViktorEduardovich-104@agency.ru', 'ViEdNo-10446', 'iktoduarovik10435'),
       (105, 'Васильев Юрий Антонович', 'Коммерческая недвижимость', 79294697551, 'VasilevYuriyAntonovich-105@agency.ru', 'YuAnVa-10511', 'uriyntonasil10587'),
       (106, 'Баранов Виктор Артёмович', 'Коммерческая недвижимость', 79294278643, 'BaranovViktorArtemovich-106@agency.ru', 'ViArBa-10660', 'iktortemaran10660'),
       (107, 'Игнатьев Илья Александрович', 'Жилая недвижимость', 79296633946, 'IgnatevIlyaAleksandrovich-107@agency.ru', 'IlAlIg-10730', 'lyaleksgnat10750'),
       (108, 'Романов Эдуард Юрьевич', 'Коммерческая недвижимость', 79299158916, 'RomanovEduardYurevich-108@agency.ru', 'EdYuRo-10820', 'duarurevoman10857'),
       (109, 'Солдатов Артём Ильич', 'Жилая недвижимость', 79298876260, 'SoldatovArtemIlich-109@agency.ru', 'ArIlSo-10986', 'rtemlicholda10938'),
       (110, 'Новиков Василий Вадимович', 'Коммерческая недвижимость', 79293839188, 'NovikovVasiliyVadimovich-110@agency.ru', 'VaVaNo-11091', 'asiladimovik11072'),
       (111, 'Высоцкий Пётр Вадимович', 'Жилая недвижимость', 79296044615, 'VysockiyPetrVadimovich-111@agency.ru', 'PeVaVy-11119', 'etradimysoc11116'),
       (112, 'Иванов Владимир Антонович', 'Жилая недвижимость', 79292852836, 'IvanovVladimirAntonovich-112@agency.ru', 'VlAnIv-11235', 'ladintonvano11236'),
       (113, 'Васильев Олег Евгеньевич', 'Жилая недвижимость', 79295606035, 'VasilevOlegEvgenevich-113@agency.ru', 'OlEvVa-11375', 'legvgenasil11337'),
       (114, 'Петров Антон Антонович', 'Коммерческая недвижимость', 79297451921, 'PetrovAntonAntonovich-114@agency.ru', 'AnAnPe-11445', 'ntonntonetro11473'),
       (115, 'Солдатов Арсений Юрьевич', 'Жилая недвижимость', 79292707026, 'SoldatovArseniyYurevich-115@agency.ru', 'ArYuSo-11587', 'rsenurevolda11591'),
       (116, 'Баранов Антон Антонович', 'Жилая недвижимость', 79291811019, 'BaranovAntonAntonovich-116@agency.ru', 'AnAnBa-11617', 'ntonntonaran11610'),
       (117, 'Кузнецов Арсений Петрович', 'Коммерческая недвижимость', 79290477266, 'KuznecovArseniyPetrovich-117@agency.ru', 'ArPeKu-11761', 'rsenetrouzne11729'),
       (118, 'Васнецов Виктор Владимирович', 'Коммерческая недвижимость', 79299079932, 'VasnecovViktorVladimirovich-118@agency.ru', 'ViVlVa-11845', 'iktoladiasne11811'),
       (119, 'Акимов Вадим Геннадьевич', 'Коммерческая недвижимость', 79292889665, 'AkimovVadimGennadevich-119@agency.ru', 'VaGeAk-11981', 'adimennakimo11933'),
       (120, 'Солдатов Эдуард Леонидович', 'Жилая недвижимость', 79297927551, 'SoldatovEduardLeonidovich-120@agency.ru', 'EdLeSo-12025', 'duareoniolda12039'),
       (121, 'Кузнецов Антон Олегович', 'Коммерческая недвижимость', 79292731500, 'KuznecovAntonOlegovich-121@agency.ru', 'AnOlKu-12169', 'ntonlegouzne12118'),
       (122, 'Иванов Дмитрий Олегович', 'Жилая недвижимость', 79299842060, 'IvanovDmitriyOlegovich-122@agency.ru', 'DmOlIv-12292', 'mitrlegovano12232'),
       (123, 'Таманский Эдуард Владимирович', 'Коммерческая недвижимость', 79295106708, 'TamanskiyEduardVladimirovich-123@agency.ru', 'EdVlTa-12384', 'duarladiaman12341'),
       (124, 'Игнатьев Антон Викторович', 'Коммерческая недвижимость', 79297773528, 'IgnatevAntonViktorovich-124@agency.ru', 'AnViIg-12465', 'ntoniktognat12431'),
       (125, 'Васнецов Василий Юрьевич', 'Коммерческая недвижимость', 79297368984, 'VasnecovVasiliyYurevich-125@agency.ru', 'VaYuVa-12541', 'asilurevasne12519'),
       (126, 'Круглов Геннадий Дмитриевич', 'Жилая недвижимость', 79291825904, 'KruglovGennadiyDmitrievich-126@agency.ru', 'GeDmKr-12682', 'ennamitrrugl12661'),
       (127, 'Акимов Александр Антонович', 'Жилая недвижимость', 79290272488, 'AkimovAleksandrAntonovich-127@agency.ru', 'AlAnAk-12786', 'leksntonkimo12772'),
       (128, 'Акимов Арсений Викторович', 'Коммерческая недвижимость', 79297270555, 'AkimovArseniyViktorovich-128@agency.ru', 'ArViAk-12887', 'rseniktokimo12812'),
       (129, 'Новиков Василий Васильевич', 'Коммерческая недвижимость', 79296539921, 'NovikovVasiliyVasilevich-129@agency.ru', 'VaVaNo-12979', 'asilasilovik12999'),
       (130, 'Высоцкий Геннадий Дмитриевич', 'Жилая недвижимость', 79292765087, 'VysockiyGennadiyDmitrievich-130@agency.ru', 'GeDmVy-13074', 'ennamitrysoc13054'),
       (131, 'Романов Евгений Артёмович', 'Коммерческая недвижимость', 79293212983, 'RomanovEvgeniyArtemovich-131@agency.ru', 'EvArRo-13165', 'vgenrtemoman13167'),
       (132, 'Шульц Иван Геннадьевич', 'Жилая недвижимость', 79290534994, 'ShulcIvanGennadevich-132@agency.ru', 'IvGeSh-13270', 'vanennahulc13238'),
       (133, 'Баранов Олег Петрович', 'Коммерческая недвижимость', 79298098191, 'BaranovOlegPetrovich-133@agency.ru', 'OlPeBa-13315', 'legetroaran13324'),
       (134, 'Петров Иван Геннадьевич', 'Жилая недвижимость', 79299711162, 'PetrovIvanGennadevich-134@agency.ru', 'IvGePe-13437', 'vanennaetro13463'),
       (135, 'Романов Владимир Эдуардович', 'Жилая недвижимость', 79292091398, 'RomanovVladimirEduardovich-135@agency.ru', 'VlEdRo-13514', 'ladiduaroman13598'),
       (136, 'Васнецов Илья Артёмович', 'Жилая недвижимость', 79295439088, 'VasnecovIlyaArtemovich-136@agency.ru', 'IlArVa-13610', 'lyartemasne13689'),
       (137, 'Круглов Антон Александрович', 'Коммерческая недвижимость', 79291043261, 'KruglovAntonAleksandrovich-137@agency.ru', 'AnAlKr-13756', 'ntonleksrugl13732'),
       (138, 'Баранов Вадим Вадимович', 'Коммерческая недвижимость', 79295669890, 'BaranovVadimVadimovich-138@agency.ru', 'VaVaBa-13889', 'adimadimaran13876'),
       (139, 'Ерёмин Леонид Юрьевич', 'Жилая недвижимость', 79299569000, 'EreminLeonidYurevich-139@agency.ru', 'LeYuEr-13961', 'eoniurevremi13934'),
       (140, 'Круглов Дмитрий Вадимович', 'Коммерческая недвижимость', 79290200298, 'KruglovDmitriyVadimovich-140@agency.ru', 'DmVaKr-14079', 'mitradimrugl14027'),
       (141, 'Петров Юрий Александрович', 'Жилая недвижимость', 79291906334, 'PetrovYuriyAleksandrovich-141@agency.ru', 'YuAlPe-14175', 'uriyleksetro14170'),
       (142, 'Егоров Арсений Вадимович', 'Коммерческая недвижимость', 79299868855, 'EgorovArseniyVadimovich-142@agency.ru', 'ArVaEg-14297', 'rsenadimgoro14223'),
       (143, 'Игнатьев Владимир Евгеньевич', 'Коммерческая недвижимость', 79299652666, 'IgnatevVladimirEvgenevich-143@agency.ru', 'VlEvIg-14324', 'ladivgengnat14340'),
       (144, 'Баранов Евгений Леонидович', 'Жилая недвижимость', 79298094286, 'BaranovEvgeniyLeonidovich-144@agency.ru', 'EvLeBa-14456', 'vgeneoniaran14424'),
       (145, 'Антипов Вадим Петрович', 'Коммерческая недвижимость', 79299835099, 'AntipovVadimPetrovich-145@agency.ru', 'VaPeAn-14588', 'adimetrontip14580'),
       (146, 'Петров Олег Владимирович', 'Жилая недвижимость', 79290507738, 'PetrovOlegVladimirovich-146@agency.ru', 'OlVlPe-14682', 'legladietro14652'),
       (147, 'Петров Арсений Евгеньевич', 'Коммерческая недвижимость', 79298749578, 'PetrovArseniyEvgenevich-147@agency.ru', 'ArEvPe-14786', 'rsenvgenetro14759'),
       (148, 'Высоцкий Александр Юрьевич', 'Коммерческая недвижимость', 79291695419, 'VysockiyAleksandrYurevich-148@agency.ru', 'AlYuVy-14844', 'leksurevysoc14880'),
       (149, 'Егоров Антон Васильевич', 'Жилая недвижимость', 79290515667, 'EgorovAntonVasilevich-149@agency.ru', 'AnVaEg-14926', 'ntonasilgoro14961'),
       (150, 'Солдатов Евгений Эдуардович', 'Жилая недвижимость', 79291323811, 'SoldatovEvgeniyEduardovich-150@agency.ru', 'EvEdSo-15012', 'vgenduarolda15043')