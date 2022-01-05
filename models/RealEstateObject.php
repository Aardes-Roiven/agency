<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "real_estate_object".
 *
 * @property int $id
 * @property int $building_id
 * @property string $local_address
 * @property int $places
 * @property float $price
 * @property int $area
 * @property int $floor
 * @property string $type
 * @property string $estate_type
 *
 * @property RealEstateBuilding $building
 * @property Deal[] $deals
 */
class RealEstateObject extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'real_estate_object';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['building_id', 'local_address', 'places', 'price', 'area', 'floor', 'type', 'estate_type'], 'required'],
            [['building_id', 'places', 'area', 'floor'], 'default', 'value' => null],
            [['building_id', 'places', 'area', 'floor'], 'integer'],
            [['local_address', 'type', 'estate_type'], 'string'],
            [['price'], 'number'],
            [['building_id'], 'exist', 'skipOnError' => true, 'targetClass' => RealEstateBuilding::className(), 'targetAttribute' => ['building_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор',
            'building_id' => 'Идентификатор здания',
            'local_address' => 'Локальный адрес объекта',
            'places' => 'Количество помещений объекта',
            'price' => 'Цена объекта',
            'area' => 'Площадь объекта',
            'floor' => 'Этаж объекта',
            'type' => 'Тип объекта',
            'estate_type' => 'Род объекта',
        ];
    }

    /**
     * Gets query for [[Building]].
     *
     * @return ActiveQuery
     */
    public function getBuilding()
    {
        return $this->hasOne(RealEstateBuilding::className(), ['id' => 'building_id']);
    }

    /**
     * Gets query for [[Deals]].
     *
     * @return ActiveQuery
     */
    public function getDeal()
    {
        return $this->hasOne(Deal::className(), ['real_estate_obj_id' => 'id']);
    }
}
