<?php

namespace app\controllers;

use yii\web\Controller;
use yii\filters\AccessControl;

class AccessController extends Controller
{
    public function behaviors()
    {
        return [
            "access" => [
                "class" => AccessControl::class,
                "rules" => [
                    [
                        "allow" => true,
                        "roles" => ['@'],
                    ]
                ]
            ]
        ];
    }
    static function beautifyNumber($number){
        if(strlen(trim($number)) === 11){
            $array = [
                substr($number, 0, 1),
                substr($number, 1, 3),
                substr($number, 4, 3),
                substr($number, 7, 2),
                substr($number, 9, 2),
            ];
            return $array ? '+' . $array[0] . '(' . $array[1] . ') ' .
                $array[2] . '-' . $array[3] . '-' .
                $array[4] : 'не найдено';
        }else return $number;
    }
}