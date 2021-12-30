<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "client".
 *
 * @property int $id
 * @property string $name
 * @property string $status
 * @property string $number
 * @property string|null $email
 *
 * @property Deal[] $deals
 */
class Client extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'client';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'number'], 'required'],
            [['name', 'status', 'email'], 'string'],
            [['number'], 'string', 'max' => 12],
            [['email'], 'unique'],
            [['number'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор',
            'name' => 'Имя',
            'status' => 'Статус',
            'number' => 'Контактный номер',
            'email' => 'Электронная почта',
        ];
    }

    /**
     * Gets query for [[Deals]].
     *
     * @return ActiveQuery
     */
    public function getDeals()
    {
        return $this->hasMany(Deal::className(), ['client_id' => 'id']);
    }
}
