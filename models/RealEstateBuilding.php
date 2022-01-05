<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "real_estate_building".
 *
 * @property int $id
 * @property string $address
 * @property int|null $complex_id
 * @property int $floor_count
 * @property int $dev_id
 *
 * @property RealEstateComplex $complex
 * @property PropertyDev $dev
 * @property RealEstateObject[] $realEstateObjects
 */
class RealEstateBuilding extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'real_estate_building';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['address', 'floor_count', 'dev_id'], 'required'],
            [['address'], 'string'],
            [['complex_id', 'floor_count', 'dev_id'], 'default', 'value' => null],
            [['complex_id', 'floor_count', 'dev_id'], 'integer'],
            [['dev_id'], 'exist', 'skipOnError' => true, 'targetClass' => PropertyDev::className(), 'targetAttribute' => ['dev_id' => 'id']],
            [['complex_id'], 'exist', 'skipOnError' => true, 'targetClass' => Complex::className(), 'targetAttribute' => ['complex_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор',
            'address' => 'Адрес здания',
            'complex_id' => 'Идентификатор комплекса',
            'floor_count' => 'Количество этажей',
            'dev_id' => 'Идентификатор застройщика',
        ];
    }

    /**
     * Gets query for [[Complex]].
     *
     * @return ActiveQuery
     */
    public function getComplex()
    {
        return $this->hasOne(Complex::className(), ['id' => 'complex_id']);
    }

    /**
     * Gets query for [[Dev]].
     *
     * @return ActiveQuery
     */
    public function getDev()
    {
        return $this->hasOne(PropertyDev::className(), ['id' => 'dev_id']);
    }

    /**
     * Gets query for [[RealEstateObjects]].
     *
     * @return ActiveQuery
     */
    public function getRealEstateObjects()
    {
        return $this->hasMany(RealEstateObject::className(), ['building_id' => 'id']);
    }
}
