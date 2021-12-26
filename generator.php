<?php

$array = [
    'nameArray' => [
        "Василий",
        "Александр",
        "Евгений",
        "Арсений",
        "Виктор",
        "Владимир",
        "Илья",
        "Юрий",
        "Пётр",
        "Дмитрий",
        "Олег",
        "Геннадий",
        "Антон",
        "Артём",
        "Вадим",
        "Иван",
        "Эдуард",
        "Леонид"
    ],
    'fathersNameArray' => [
        "Васильевич",
        "Александрович",
        "Евгеньевич",
        "Арсеньевич",
        "Викторович",
        "Владимирович",
        "Ильич",
        "Юрьевич",
        "Петрович",
        "Дмитриевич",
        "Олегович",
        "Геннадьевич",
        "Антонович",
        "Артёмович",
        "Вадимович",
        "Иванович",
        "Эдуардович",
        "Леонидович"
    ],
    'lastnameArray' => [
        "Кузнецов",
        "Иванов",
        "Петров",
        "Васильев",
        "Солдатов",
        "Новиков",
        "Игнатьев",
        "Васнецов",
        "Романов",
        "Баранов",
        "Круглов",
        "Таманский",
        "Шульц",
        "Акимов",
        "Высоцкий",
        "Егоров",
        "Ерёмин",
        "Антипов"
    ],
    'specialization' => [
        "Жилая недвижимость",
        "Коммерческая недвижимость"
    ],
    'client_status' => [
        "Приоритетный",
        "Повышенный",
        "Обычный"
    ],
    'companyName' => [
        "",
        "ПИК",
        "Домстрой",
        "CapitalGroup",
        "Донстрой",
        "ФСК",
        "Удача",
        "Главстрой",
        "Группа Эталон",
        "Концерн Крост",
        "ГК-Пионер",
        "Интеко",
        "Инград",
        "МосРеалСтрой",
        "Каскад",
        "ГК-МИЦ",
        "Юнит",
        "Комстрин",
        "Скайгард",
        "Бесткон",
        "Астерра"
    ],
    "building_address" => [
        "Красноармейская",
        "Донская",
        "Лужники",
        "Ярмарочная",
        "Петровская",
        "Ленинска",
        "Европейская",
        "Кутузовская",
        "Пушкинская",
        "Васильевская",
        "Щукинская",
        "Дальняя",
        "Московская",
        "Морская",
        "Краснокаменская",
        "Харьковская",
        "Сибирская",
        "Ленинградская",
        "Вяземская",
        "Покровская",
        "Хорошевская",
        "Львовская",
        "Центральная",
        "Царская",
        "Фермерская",
        "Женевская",
        "Борисовская",
        "Жёлтая",
        "Рудниковая",
        "Андреевская",
        "Яковлевская",
        "Пушкарей",
        "Тульская",
        "Пряничная",
        "Стрелецкая",
        "Новострелецкая",
        "Владимирская",
        "Комсомольская",
        "Радужная",
        "Васнецовская"
    ],
    "type_deal" => [
        "купля-продажа",
        "аренда",
        "ипотека",
        "обмен"
    ],
    "type" => [
        "Квартира",
        "Студия",
        "Апартаменты",
        "Офис",
        "Торговая точка"
    ],
    "estate_type" => [
        "Жилая",
        "Коммерческая",
     ],
];

function rusConverter($string): string {
    $converter = array(
        'а' => 'a',   'б' => 'b',   'в' => 'v',
        'г' => 'g',   'д' => 'd',   'е' => 'e',
        'ё' => 'e',   'ж' => 'zh',  'з' => 'z',
        'и' => 'i',   'й' => 'y',   'к' => 'k',
        'л' => 'l',   'м' => 'm',   'н' => 'n',
        'о' => 'o',   'п' => 'p',   'р' => 'r',
        'с' => 's',   'т' => 't',   'у' => 'u',
        'ф' => 'f',   'х' => 'h',   'ц' => 'c',
        'ч' => 'ch',  'ш' => 'sh',  'щ' => 'sch',
        'ь' => '',  'ы' => 'y',   'ъ' => '',
        'э' => 'e',   'ю' => 'yu',  'я' => 'ya',

        'А' => 'A',   'Б' => 'B',   'В' => 'V',
        'Г' => 'G',   'Д' => 'D',   'Е' => 'E',
        'Ё' => 'E',   'Ж' => 'Zh',  'З' => 'Z',
        'И' => 'I',   'Й' => 'Y',   'К' => 'K',
        'Л' => 'L',   'М' => 'M',   'Н' => 'N',
        'О' => 'O',   'П' => 'P',   'Р' => 'R',
        'С' => 'S',   'Т' => 'T',   'У' => 'U',
        'Ф' => 'F',   'Х' => 'H',   'Ц' => 'C',
        'Ч' => 'Ch',  'Ш' => 'Sh',  'Щ' => 'Sch',
        'Ь' => '',  'Ы' => 'Y',   'Ъ' => '',
        'Э' => 'E',   'Ю' => 'Yu',  'Я' => 'Ya',
    );
    return strtr($string, $converter);
}

function createEmployee(): void{
    global $array;
    $bigStr = '';
    $querryString = 'insert into employee (id, name, specialization, number, email, login, password)' . '<br>' . 'values ';
    for ($i=1; $i<151; $i++) {
        $randomId = $i;
        $randomName = $array['nameArray'][array_rand($array['nameArray'])];
        $randomFathersName = $array['fathersNameArray'][array_rand($array['fathersNameArray'])];
        $randomLastnameArray = $array['lastnameArray'][array_rand($array['lastnameArray'])];
        $getFullName = $randomLastnameArray . " " . $randomName . " " . $randomFathersName;
        $getSpec = rand(0, 1) ? 'Коммерческая недвижимость' : 'Жилая недвижимость';
        $getNumber = '7' . rand(9290000000, 9299999999);
        $getEmail = preg_replace('/\s+/', '', rusConverter($getFullName)) . '-' . $randomId . '@agency.ru';

        $getLogin = substr(rusConverter($randomName), 0, 2) .
            substr(rusConverter($randomFathersName), 0, 2) .
            substr(rusConverter($randomLastnameArray), 0, 2) . '-' . $randomId . rand(10, 99);

        $getPassword = substr(rusConverter($randomName), 1, 4) .
            substr(rusConverter($randomFathersName), 1, 4) .
            substr(rusConverter($randomLastnameArray), 1, 4) . $randomId . rand(10, 99);

        $element = "(" . $randomId . ", " . "'" . $getFullName .
                   "'" . ", '" . $getSpec . "', " . $getNumber .
                   ", " . "'" . $getEmail . "', " .
                   "'" . $getLogin . "', " .
                   "'" . $getPassword . "'), ";
        $bigStr .= $element . '<br>';
    }
    $bigStr = $querryString . substr($bigStr, 0, -6);
    echo $bigStr;
}

function createClient(): void{
    global $array;
    $bigStr = '';
    $querryString = 'insert into client (id, name, status, number, email)' . '<br>' . 'values ';
    for ($i=1; $i<101; $i++) {
        $randomId = $i;
        $randomName = $array['nameArray'][array_rand($array['nameArray'])];
        $randomFathersName = $array['fathersNameArray'][array_rand($array['fathersNameArray'])];
        $randomLastnameArray = $array['lastnameArray'][array_rand($array['lastnameArray'])];
        $getFullName = $randomLastnameArray . " " . $randomName . " " . $randomFathersName;
        $status = array_rand($array['client_status']);
        $getNumber = '7' . rand(9290000000, 9299999999);
        $getEmail = preg_replace('/\s+/', '', rusConverter($getFullName)) . '-' . $randomId . '@agency.ru';
        $element = "(" . $randomId . ", " . "'" . $getFullName .
            "'" . ", '" . $array['client_status'][$status] . "', " . $getNumber .
            ", " . "'" . $getEmail . "'), ";
        $bigStr .= $element . '<br>';
    }
    $bigStr = $querryString . substr($bigStr, 0, -6);
    echo $bigStr;
}

function createDev(): void{
    global $array;
    $bigStr = '';
    $querryString = 'insert into property_dev (id, name, number, email)' . '<br>' . 'values ';
    for ($i=1; $i<21; $i++) {
        $randomId = $i;
        $getNumber = '7' . rand(9290000000, 9299999999);
        $getEmail = strtolower(rusConverter($array['companyName'][$randomId])) .
                    '-official' . '@' . strtolower(rusConverter($array['companyName'][$randomId])) . '.ru';
        $element = "(" . $randomId . ", '" . $array['companyName'][$randomId] .
            "', " . $getNumber . ", '" . $getEmail . "'), ";
        $bigStr .= $element . '<br>';
    }
    $bigStr = $querryString . substr($bigStr, 0, -6);
    echo $bigStr;
}

function createBuildingAndObject_1(): void{
    global $array;
    $querryBuildingString = 'insert into real_estate_building (id, address, complex_id, floor_count, dev_id)' . '<br>' . 'values ';
    $querryObjectString = 'insert into real_estate_object (id, building_id ,local_address, places, price, area, floor, type, estate_type)' . '<br>' . 'values ';
    $buildingCount = rand(6, 15);
    $id_fix = 0;
    for ($i=1; $i<$buildingCount; $i++) {
        $address = "г. Москва, ул. " . $array['building_address'][0] . ", д. " . ($i+12);
        $complex_id = 1;
        $floor_count = rand(5, 10);
        $dev_id = 1;
        echo $querryBuildingString . "(" . $i . ", '" . $address . "', " . $complex_id . ", " . ($floor_count + 1) . ", " . $dev_id . ");" .
            '<br>' . $querryObjectString;
        for ($j=1; $j<$floor_count+2; $j++) {
            $building_id = $i;
            $local_address = $j;
            $places = rand(8, 15);
            $price = rand(300, 850);
            $area = 2000;
            $floor = $j;
            $type = 0;
            $estate_type = 0;
        $element = "(". ($j+$id_fix) . ", " . $building_id . ", '" . $local_address .
            "', " . $places . ", " . ($price * 1000000) . ", " . $area . ", " . $floor . ", " . $type . ", " . $estate_type . ")";
        if ($j == $floor_count+1)
        echo $element;
        else echo $element . ', <br>';
        }
        echo "; <br>";
        $id_fix += $floor_count+1;
    }
}

function createBuildingAndObject_2(): void{
    global $array;
    $areatype = 2; // количество кв на этаже
    $querryBuildingString = 'insert into real_estate_building (id, address, complex_id, floor_count, dev_id)' . '<br>' . 'values ';
    $querryObjectString = 'insert into real_estate_object (id, building_id ,local_address, places, price, area, floor, type, estate_type)' . '<br>' . 'values ';
    $buildingCount = rand(15, 30);// количество зданий
    $id_fix = 0;
    for ($i=15; $i<($buildingCount + 15); $i++) { // менять 15 в обоих местах
        $address = "г. Москва, ул. " . $array['building_address'][1] . ", д. " . ($i+12);
        $complex_id = 3; // менять
        $floor_count = rand(5, 10); // менять
        $dev_id = 2; // менять
        echo $querryBuildingString . "(" . $i . ", '" . $address . "', " . $complex_id . ", " . ($floor_count + 1) . ", " . $dev_id . ");" .
            '<br>' . $querryObjectString;
        $v = 1;
        $z = 0;
        for ($j=118; $j<($floor_count * $areatype + 2 + 118); $j++) { // 118 менять в двух местах
            $building_id = $i;
            $local_address = $j - 117; // менять 118 - 1
            $places = rand(5, 8); // менять
            $price = rand(150, 400); // менять
            $area = rand(10, 30);// менять
            $floor = $v;
            $type = 0; // менять
            $estate_type = 0; // менять
            $element = "(". ($j+$id_fix) . ", " . $building_id . ", '" . $local_address .
                "', " . $places . ", " . ($price * 1000000) . ", " . ($area * 10) . ", " . $floor . ", " . $type . ", " . $estate_type . ")";
            if ($j == $floor_count * $areatype + 1 + 118) // менять 118
                echo $element;
            else echo $element . ', <br>';
            $z++;
            if($z == $areatype){
                $z = 0;
                $v += 1;
            }
        }
        echo "; <br>";
        $id_fix += $floor_count * $areatype + 2;
    }
}