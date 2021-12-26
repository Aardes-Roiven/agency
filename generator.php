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
        "",
        "Красноармейская",
        "Донская",
        "Лужники",
        "Ярмарочная",
        "Петровская",
        "Ленинская",
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

 $objectArray = [
     [
         "areaType" => 1,
         "buildingCount" => [15, 20],
         "address" => 1,
         "complex_id" => 1,
         "floor_count" => [1, 3],
         "dev_id" => 1,
         "places" => [8, 15],
         "price" => [300, 850],
         "area" => [2000, 2000],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [25, 35],
         "address" => 2,
         "complex_id" => 2,
         "floor_count" => [30, 50],
         "dev_id" => 2,
         "places" => [1, 4],
         "price" => [20, 60],
         "area" => [40, 100],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 3,
         "buildingCount" => [10, 20],
         "address" => 3,
         "complex_id" => 3,
         "floor_count" => [5, 10],
         "dev_id" => 3,
         "places" => [3, 6],
         "price" => [40, 160],
         "area" => [80, 200],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [25, 40],
         "address" => 4,
         "complex_id" => 4,
         "floor_count" => [40, 60],
         "dev_id" => 4,
         "places" => [1, 4],
         "price" => [6, 40],
         "area" => [20, 150],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [25, 40],
         "address" => 5,
         "complex_id" => 5,
         "floor_count" => [40, 60],
         "dev_id" => 5,
         "places" => [1, 4],
         "price" => [6, 40],
         "area" => [20, 150],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 8,
         "buildingCount" => [15, 20],
         "address" => 6,
         "complex_id" => 6,
         "floor_count" => [20, 40],
         "dev_id" => 6,
         "places" => [2, 7],
         "price" => [40, 100],
         "area" => [40, 200],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 5,
         "buildingCount" => [35, 40],
         "address" => 7,
         "complex_id" => 7,
         "floor_count" => [40, 60],
         "dev_id" => 7,
         "places" => [1, 4],
         "price" => [10, 30],
         "area" => [40, 100],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 3,
         "buildingCount" => [15, 30],
         "address" => 8,
         "complex_id" => 8,
         "floor_count" => [15, 20],
         "dev_id" => 8,
         "places" => [1, 4],
         "price" => [30, 100],
         "area" => [40, 100],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 6,
         "buildingCount" => [13, 15],
         "address" => 9,
         "complex_id" => 9,
         "floor_count" => [50, 70],
         "dev_id" => 9,
         "places" => [1, 4],
         "price" => [60, 150],
         "area" => [40, 100],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [20, 40],
         "address" => 10,
         "complex_id" => 10,
         "floor_count" => [20, 30],
         "dev_id" => 10,
         "places" => [1, 4],
         "price" => [60, 150],
         "area" => [40, 100],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 6,
         "buildingCount" => [15, 20],
         "address" => 11,
         "complex_id" => 11,
         "floor_count" => [20, 30],
         "dev_id" => 11,
         "places" => [1, 3],
         "price" => [80, 250],
         "area" => [90, 300],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [10, 20],
         "address" => 12,
         "complex_id" => 12,
         "floor_count" => [20, 30],
         "dev_id" => 12,
         "places" => [10, 15],
         "price" => [400, 1500],
         "area" => [400, 1000],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [15, 20],
         "address" => 13,
         "complex_id" => 13,
         "floor_count" => [20, 30],
         "dev_id" => 13,
         "places" => [2, 4],
         "price" => [80, 250],
         "area" => [90, 300],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [15, 20],
         "address" => 14,
         "complex_id" => 14,
         "floor_count" => [20, 30],
         "dev_id" => 14,
         "places" => [1, 3],
         "price" => [40, 150],
         "area" => [90, 200],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 4,
         "buildingCount" => [10, 20],
         "address" => 15,
         "complex_id" => 15,
         "floor_count" => [20, 30],
         "dev_id" => 15,
         "places" => [2, 4],
         "price" => [40, 150],
         "area" => [40, 100],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 6,
         "buildingCount" => [35, 35],
         "address" => 16,
         "complex_id" => 16,
         "floor_count" => [40, 50],
         "dev_id" => 16,
         "places" => [1, 3],
         "price" => [3, 15],
         "area" => [18, 80],
         "type" => 0,
         "estate_type" => 0,
     ],
     [
         "areaType" => 5,
         "buildingCount" => [10, 20],
         "address" => 17,
         "complex_id" => 17,
         "floor_count" => [10, 20],
         "dev_id" => 17,
         "places" => [1, 3],
         "price" => [40, 90],
         "area" => [30, 100],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 5,
         "buildingCount" => [10, 20],
         "address" => 18,
         "complex_id" => 18,
         "floor_count" => [10, 20],
         "dev_id" => 18,
         "places" => [1, 3],
         "price" => [50, 130],
         "area" => [30, 100],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 5,
         "buildingCount" => [10, 20],
         "address" => 19,
         "complex_id" => 19,
         "floor_count" => [10, 20],
         "dev_id" => 19,
         "places" => [1, 3],
         "price" => [40, 90],
         "area" => [30, 100],
         "type" => 3,
         "estate_type" => 1,
     ],
     [
         "areaType" => 5,
         "buildingCount" => [10, 20],
         "address" => 20,
         "complex_id" => 20,
         "floor_count" => [10, 20],
         "dev_id" => 20,
         "places" => [1, 3],
         "price" => [50, 130],
         "area" => [30, 100],
         "type" => 3,
         "estate_type" => 1,
     ],
 ];

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

$globBuildingCount = 1;
$globObjCount = 1;
function createBuildingAndObject(): void
{
    global $array;
    global $objectArray;
    global $globBuildingCount;
    global $globObjCount;
    for ($u = 0; $u < count($objectArray); $u++) { // count($objectArray)
        $areaType = $objectArray[$u]["areaType"]; // количество кв на этаже
        $querryBuildingString = 'insert into real_estate_building (id, address, complex_id, floor_count, dev_id)' . '<br>' . 'values ';
        $querryObjectString = 'insert into real_estate_object (id, building_id ,local_address, places, price, area, floor, type, estate_type)' . '<br>' . 'values ';
        $buildingCount = rand($objectArray[$u]["buildingCount"][0], $objectArray[$u]["buildingCount"][1]);// количество зданий
        $id_fix = 0;
        for ($i = 1; $i < $buildingCount; $i++) { // менять 15 в обоих местах // $buildingCount + 15
            $address = "г. Москва, ул. " . $array['building_address'][$u] . ", д. " . ($i + 12);
            $complex_id = $objectArray[$u]["complex_id"];
            $floor_count = rand($objectArray[$u]["floor_count"][0], $objectArray[$u]["floor_count"][1]);
            $dev_id = $objectArray[$u]["dev_id"];
            echo $querryBuildingString . "(" . $globBuildingCount . ", '" . $address . "', " . $complex_id . ", " . $floor_count . ", " . $dev_id . ");" .
                '<br>' . $querryObjectString;
            $v = 1;
            $z = 0;
            for ($j = 1; $j <= ($floor_count * $areaType); $j++) {
                $local_address = $j;
                $places = rand($objectArray[$u]["places"][0], $objectArray[$u]["places"][1]);
                $price = rand($objectArray[$u]["price"][0], $objectArray[$u]["price"][1]);
                $area = rand($objectArray[$u]["area"][0], $objectArray[$u]["area"][1]);
                $floor = $v;
                $type = $objectArray[$u]["type"];
                $estate_type = $objectArray[$u]["estate_type"];
                $element = "(" . ($globObjCount) . ", " . $globBuildingCount . ", '" . $local_address .
                    "', " . $places . ", " . ($price * 1000000) . ", " . ($area * 10) . ", " . $floor . ", " . $type . ", " . $estate_type . ")";
                if ($j == $floor_count * $areaType) echo $element;
                else echo $element . ', <br>';
                $z++;
                if ($z == $areaType) {
                    $z = 0;
                    $v += 1;
                }
                $globObjCount++;
            }
            echo "; <br>";
            $id_fix += $floor_count * $areaType + 2;
            $globBuildingCount++;
        }
    }
}

function createDeal(): void
{

}