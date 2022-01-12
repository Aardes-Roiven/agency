<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\MtmEmployeeDeal */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="mtm-employee-deal-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'deal_id')->textInput() ?>

    <?= $form->field($model, 'employee_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
