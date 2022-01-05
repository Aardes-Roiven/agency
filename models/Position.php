<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "position".
 *
 * @property int $id
 * @property string $name
 * @property int $access_code
 *
 * @property Employee[] $employees
 */
class Position extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'access_code'], 'required'],
            [['name'], 'string'],
            [['access_code'], 'default', 'value' => null],
            [['access_code'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор должности',
            'name' => 'Должность',
            'access_code' => 'Уровень доступа',
        ];
    }

    /**
     * Gets query for [[Employees]].
     *
     * @return ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::class, ['position_id' => 'id']);
    }
}
