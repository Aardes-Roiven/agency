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
    for ($i=1; $i<151; $i++) {
        $querryString = 'insert into employee (id, name, specialization, number, email, login, password)' . '<br>' . 'values ';
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