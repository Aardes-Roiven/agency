<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "property_dev".
 *
 * @property int $id
 * @property string $name
 * @property string $number
 * @property string $email
 *
 * @property RealEstateBuilding[] $realEstateBuildings
 */
class PropertyDev extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'property_dev';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'number', 'email'], 'required'],
            [['name', 'email'], 'string'],
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
            'name' => 'Название застройщика',
            'number' => 'Контактный телефон застройщика',
            'email' => 'Контактная почта застройщика',
        ];
    }

    /**
     * Gets query for [[RealEstateBuildings]].
     *
     * @return ActiveQuery
     */
    public function getRealEstateBuildings()
    {
        return $this->hasMany(RealEstateBuilding::className(), ['dev_id' => 'id']);
    }
}
