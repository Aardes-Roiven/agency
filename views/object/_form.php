<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RealEstateObject */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="real-estate-object-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'building_id')->textInput() ?>

    <?= $form->field($model, 'local_address')->textInput() ?>

    <?= $form->field($model, 'places')->textInput() ?>

    <?= $form->field($model, 'price')->textInput() ?>

    <?= $form->field($model, 'area')->textInput() ?>

    <?= $form->field($model, 'floor')->textInput() ?>

    <?= $form->field($model, 'type')->textInput() ?>

    <?= $form->field($model, 'estate_type')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Сохранить', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
