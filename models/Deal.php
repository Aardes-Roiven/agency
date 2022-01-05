<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "deal".
 *
 * @property int $id
 * @property int $real_estate_obj_id
 * @property int $client_id
 * @property string $type
 * @property string $status
 * @property string $contract_number
 *
 * @property Client $client
 * @property Employee[] $employees
 * @property MtmEmployeeDeal[] $mtmEmployeeDeals
 * @property RealEstateObject $realEstateObj
 */
class Deal extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'deal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['real_estate_obj_id', 'client_id', 'type', 'status', 'contract_number'], 'required'],
            [['real_estate_obj_id', 'client_id'], 'default', 'value' => null],
            [['real_estate_obj_id', 'client_id'], 'integer'],
            [['type', 'status', 'contract_number'], 'string'],
            [['client_id'], 'exist', 'skipOnError' => true, 'targetClass' => Client::className(), 'targetAttribute' => ['client_id' => 'id']],
            [['real_estate_obj_id'], 'exist', 'skipOnError' => true, 'targetClass' => RealEstateObject::className(), 'targetAttribute' => ['real_estate_obj_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор',
            'real_estate_obj_id' => 'Идентификатор объекта',
            'client_id' => 'Идентификатор клиента',
            'type' => 'Тип',
            'status' => 'Статус',
            'contract_number' => 'Номер юр. договора',
        ];
    }

    /**
     * Gets query for [[Client]].
     *
     * @return ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(Client::className(), ['id' => 'client_id']);
    }

    /**
     * Gets query for [[Employees]].
     *
     * @return ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['id' => 'employee_id'])->viaTable('mtm_employee_deal', ['deal_id' => 'id']);
    }

    /**
     * Gets query for [[MtmEmployeeDeals]].
     *
     * @return ActiveQuery
     */
    public function getMtmEmployeeDeals()
    {
        return $this->hasMany(MtmEmployeeDeal::className(), ['deal_id' => 'id']);
    }

    /**
     * Gets query for [[RealEstateObj]].
     *
     * @return ActiveQuery
     */
    public function getRealEstateObj()
    {
        return $this->hasOne(RealEstateObject::className(), ['id' => 'real_estate_obj_id']);
    }
}
