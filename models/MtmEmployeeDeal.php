<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "mtm_employee_deal".
 *
 * @property int $deal_id
 * @property int $employee_id
 *
 * @property Deal $deal
 * @property Employee $employee
 */
class MtmEmployeeDeal extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'mtm_employee_deal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['deal_id', 'employee_id'], 'required'],
            [['deal_id', 'employee_id'], 'default', 'value' => null],
            [['deal_id', 'employee_id'], 'integer'],
            [['deal_id', 'employee_id'], 'unique', 'targetAttribute' => ['deal_id', 'employee_id']],
            [['deal_id'], 'exist', 'skipOnError' => true, 'targetClass' => Deal::className(), 'targetAttribute' => ['deal_id' => 'id']],
            [['employee_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['employee_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'deal_id' => 'Deal ID',
            'employee_id' => 'Employee ID',
        ];
    }

    /**
     * Gets query for [[Deal]].
     *
     * @return ActiveQuery
     */
    public function getDeal()
    {
        return $this->hasOne(Deal::className(), ['id' => 'deal_id']);
    }

    /**
     * Gets query for [[Employee]].
     *
     * @return ActiveQuery
     */
    public function getEmployee()
    {
        return $this->hasOne(Employee::className(), ['id' => 'employee_id']);
    }
}
