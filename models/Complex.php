<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "real_estate_complex".
 *
 * @property int $id
 * @property string $name
 * @property string $type
 * @property string $comfort_class
 *
 * @property RealEstateBuilding[] $realEstateBuildings
 */
class Complex extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'real_estate_complex';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'type', 'comfort_class'], 'required'],
            [['name', 'type', 'comfort_class'], 'string'],
            [['name'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор комплекса',
            'name' => 'Название комплекса',
            'type' => 'Тип комплекса',
            'comfort_class' => 'Класс комфорта комплекса',
        ];
    }

    /**
     * Gets query for [[RealEstateBuildings]].
     *
     * @return ActiveQuery
     */
    public function getRealEstateBuildings()
    {
        return $this->hasMany(RealEstateBuilding::className(), ['complex_id' => 'id']);
    }
}
