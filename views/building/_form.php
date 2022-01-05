<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateBuilding */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="real-estate-building-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'address')->textInput() ?>

    <?= $form->field($model, 'complex_id')->textInput() ?>

    <?= $form->field($model, 'floor_count')->textInput() ?>

    <?= $form->field($model, 'dev_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
