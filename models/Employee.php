<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "employee".
 *
 * @property int $id
 * @property string $name
 * @property string|null $specialization
 * @property string $number
 * @property string $email
 * @property string $login
 * @property string $password
 * @property int|null $senior_id
 * @property int|null $position_id
 *
 * @property Deal[] $deals
 * @property Employee[] $employees
 * @property MtmEmployeeDeal[] $mtmEmployeeDeals
 * @property Position $position
 * @property Employee $senior
 */
class Employee extends ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'number', 'email', 'login', 'password'], 'required'],
            [['name', 'specialization', 'email', 'login', 'password'], 'string'],
            [['senior_id', 'position_id'], 'default', 'value' => null],
            [['senior_id', 'position_id'], 'integer'],
            [['number'], 'string', 'max' => 12],
            [['email'], 'unique'],
            [['login'], 'unique'],
            [['number'], 'unique'],
            [['senior_id'], 'exist', 'skipOnError' => true, 'targetClass' => Employee::className(), 'targetAttribute' => ['senior_id' => 'id']],
            [['position_id'], 'exist', 'skipOnError' => true, 'targetClass' => Position::className(), 'targetAttribute' => ['position_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'Идентификатор сотрудника',
            'name' => 'Имя',
            'specialization' => 'Специализация',
            'number' => 'Номер',
            'email' => 'Почта',
            'login' => 'Логин',
            'password' => 'Пароль',
            'senior_id' => 'Идентификатор руководителя',
            'position_id' => 'Идентификатор должности',
        ];
    }

    /**
     * Gets query for [[Deals]].
     *
     * @return ActiveQuery
     */
    public function getDeals()
    {
        return $this->hasMany(Deal::className(), ['id' => 'deal_id'])->viaTable('mtm_employee_deal', ['employee_id' => 'id']);
    }

    /**
     * Gets query for [[Employees]].
     *
     * @return ActiveQuery
     */
    public function getEmployees()
    {
        return $this->hasMany(Employee::className(), ['senior_id' => 'id']);
    }

    /**
     * Gets query for [[MtmEmployeeDeals]].
     *
     * @return ActiveQuery
     */
    public function getMtmEmployeeDeals()
    {
        return $this->hasMany(MtmEmployeeDeal::className(), ['employee_id' => 'id']);
    }

    /**
     * Gets query for [[Position]].
     *
     * @return ActiveQuery
     */
    public function getPosition()
    {
        return $this->hasOne(Position::className(), ['id' => 'position_id']);
    }

    /**
     * Gets query for [[Senior]].
     *
     * @return ActiveQuery
     */
    public function getSenior()
    {
        return $this->hasOne(Employee::class, ['id' => 'senior_id']);
    }
}
